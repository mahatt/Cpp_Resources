# include "LoopMetadataPass.h"


namespace {

struct LoopMetadataPass : public LoopPass {
  static char ID;
  LoopMetadataPass() : LoopPass(ID) {}

  void addMetadata(Instruction* I){
    LLVMContext& C = I->getContext();
    StringRef SrcFileName = I->getModule()->getSourceFileName();
    MDNode* MDSrc = MDNode::get(C, MDString::get(C, "Q.BackEdge.File"));
    I->setMetadata(SrcFileName, MDSrc);

    auto debugLoc =  I->getDebugLoc();
    unsigned lineNo = debugLoc? debugLoc->getLine() : 0;

    MDNode* MDline = MDNode::get(C, MDString::get(C, "Q.BackEdge.Loc"));    
    
    auto lineStr = itostr(lineNo);

    I->setMetadata(lineStr, MDline);
  }

  void getAnalysisUsage(AnalysisUsage &AU) const override {
    //AU.addRequired<SimplifyCFGPass>();    
    AU.addRequired<LoopInfoWrapperPass>();
    AU.addRequired<ScalarEvolutionWrapperPass>();    
  } 

  bool runOnLoop(Loop *L, LPPassManager& LPM) override {

    auto *SEW = getAnalysisIfAvailable<ScalarEvolutionWrapperPass>();

    SmallVector<BasicBlock*> LoopLatches;
    L->getLoopLatches(LoopLatches);

    for(auto& latch: LoopLatches){
      addMetadata(latch->getTerminator());
    }

    PHINode * IV = L->getInductionVariable(SEW->getSE());
    if(IV) 
      addMetadata(IV);
    return true;
  }

}; // end of LoopMetadataPass

}  // end of anonymous namespace

char LoopMetadataPass::ID = 0;

static RegisterPass<LoopMetadataPass> X("Qloop", "Loop get_metadata Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);