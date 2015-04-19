local function FadeSystem()
	return tiny.processingSystem(
		tiny.requireAll("fadeTime", "alpha"),
		function(e, dt)
			e.alpha = e.alpha - dt / e.fadeTime
		end
	)
end

return FadeSystem