function ld_dyn(url_path,css){
	var head = document.getElementsByTagName('head')[0]
    var script = document.createElement('script') 
    script.src = url_path
    script.type = 'text/javascript'
    head.append(script)
	
	var style = document.createElement('link') 
    style.href = css
    style.type = 'text/css'
    style.rel = 'stylesheet'
    head.append(style);
	
	script.addEventListener("load", () => {
		hljs.highlightAll();
	});
	script.addEventListener("error", (ev) => {
		console.log("Highlight JS loading Failed", ev);
	});	
}
ld_dyn('https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.8.0/highlight.min.js',
'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.8.0/styles/stackoverflow-dark.min.css')