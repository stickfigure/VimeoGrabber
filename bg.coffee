
handler = (details) ->
	console.log("*************************** #{JSON.stringify(details)}")

	if details.parentFrameId == 0
		#a = document.createElement('a')
		#a.href = details.url
		#a.download = 'movie.mp4'
		#a.click()

		#window.open(details.url)

		chrome.tabs.create
			url: details.url
			active: false

		return {cancel:true}

filter = { urls: ['*://av.vimeo.com/*.mp4*', '*://*.vimeocdn.com/*.mp4*'] }

console.log("*************************** starting up")
chrome.webRequest.onBeforeRequest.addListener(handler, filter)
