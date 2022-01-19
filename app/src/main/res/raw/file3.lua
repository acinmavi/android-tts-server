return {
    path = "/tts",
    method = Method.GET,
    consumer = function(request)
        local format = "MP3"
        local audioFormat = AudioFormat.MP3
        local mime = Mime[format]
        local language = request.query.lang or "en"
        local data = request.query.phrase or "No data"

        log.info("Saying to " .. format .. " data " .. data.. " file (lang: " .. language .. ")...")
        local file = tts.sayToCache(data, language, audioFormat)

        return {
            mime = mime,
            cached = false,
            data = file
        }
    end
}