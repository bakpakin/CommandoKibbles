local function FadeSystem()
	return tiny.processingSystem(
		tiny.requireAll("fadeTime", "alpha"),
		function(e, dt)
			e.alpha = math.min(1, math.max(0, e.alpha - dt / e.fadeTime))
		end
	)
end

return FadeSystem