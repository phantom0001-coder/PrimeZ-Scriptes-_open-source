-- LOCUS isolation test: finds out if fetch, print and GUI work in your executor
print("[locus-test] script started")
local ok, err = pcall(function()
	local parented = false
	local gui = Instance.new("ScreenGui")
	gui.Name = "LOCUS_TEST"
	gui.ResetOnSpawn = false
	if type(gethui) == "function" then
		local okH, hui = pcall(gethui)
		if okH and hui then gui.Parent = hui parented = true end
	end
	if not parented then
		local okC = pcall(function() gui.Parent = game:GetService("CoreGui") end)
		parented = okC and gui.Parent ~= nil
	end
	if not parented then
		pcall(function()
			local lp = game:GetService("Players").LocalPlayer
			gui.Parent = lp:FindFirstChildOfClass("PlayerGui")
		end)
	end
	print("[locus-test] gui parent = " .. tostring(gui.Parent))
	local f = Instance.new("Frame")
	f.Size = UDim2.new(0, 320, 0, 90)
	f.Position = UDim2.new(0.5, -160, 0.5, -45)
	f.BackgroundColor3 = Color3.fromRGB(8, 12, 14)
	f.BorderSizePixel = 0
	local t = Instance.new("TextLabel")
	t.Size = UDim2.new(1, 0, 1, 0)
	t.BackgroundTransparency = 1
	t.Text = "LOCUS TEST - GUI WORKS"
	t.TextColor3 = Color3.fromRGB(112, 240, 179)
	t.TextScaled = true
	t.Parent = f
	f.Parent = gui
end)
print("[locus-test] finished, ok=" .. tostring(ok) .. " err=" .. tostring(err))
