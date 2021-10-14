return function(playerName,interval,onlyHeightScaled,Shrinking)
	local player = game.Players:FindFirstChild(playerName)
	local character = player.Character
	local humanoid = character.Humanoid
	local runservice = game["Run Service"]
	
	if humanoid.RigType == Enum.HumanoidRigType.R15 then
		print("yay")
		while humanoid.Health ~= 0 and humanoid.HeadScale.Value > 0.05 do
			if Shrinking == false then
				if onlyHeightScaled == false then
					humanoid.BodyDepthScale.Value = humanoid.BodyDepthScale.Value + interval
					humanoid.BodyWidthScale.Value = humanoid.BodyWidthScale.Value + interval
					humanoid.HeadScale.Value = humanoid.HeadScale.Value + interval
					humanoid.WalkSpeed = humanoid.WalkSpeed + interval
					humanoid.JumpPower = humanoid.JumpPower + (interval * 10)
					humanoid.JumpHeight = humanoid.JumpHeight + (interval * 10)
					humanoid.MaxHealth = humanoid.MaxHealth + interval
				end
				humanoid.BodyHeightScale.Value = humanoid.BodyHeightScale.Value + interval
				player.CameraMaxZoomDistance = player.CameraMaxZoomDistance + (interval * 100)
			elseif Shrinking == true then
				if onlyHeightScaled == false then
					humanoid.BodyDepthScale.Value = humanoid.BodyDepthScale.Value - interval
					humanoid.BodyWidthScale.Value = humanoid.BodyWidthScale.Value - interval
					humanoid.HeadScale.Value = humanoid.HeadScale.Value - interval
					humanoid.WalkSpeed = humanoid.WalkSpeed - interval
					humanoid.JumpPower = humanoid.JumpPower - (interval * 10)
					humanoid.JumpHeight = humanoid.JumpHeight - (interval * 10)
					humanoid.MaxHealth = humanoid.MaxHealth - interval
				end
				humanoid.BodyHeightScale.Value = humanoid.BodyHeightScale.Value - interval
			end
			runservice.Heartbeat:Wait()
		end
	else
		error("This script is incompatible with R6 characters.")
	end
end