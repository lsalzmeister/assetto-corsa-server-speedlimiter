local messageSent = 0
local brake = 0

-- load EXTRA_TWEAKS config
extras = ac.INIConfig.onlineExtras():mapSection('EXTRA_TWEAKS', {
    -- default values if no values are set
    MAX_SPEED_LIMIT = 500,
    BRAKE_TO = 499,
    BRAKE_FORCE = 0
  })

function checkSpeed()
    -- Get the player's car speed
    local carSpeed = ac.getCar(carIndex).speedKmh
    if carSpeed then
        ac.debug('Speed', carSpeed)
        -- if car slowed down, disable braking and reset message
        if carSpeed < extras.BRAKE_TO and brake == 1 then
            brake =  0
            messageSent = 0
        end
        -- Check if the speed is above the speed limit or braking is active
        if carSpeed > extras.MAX_SPEED_LIMIT or brake == 1 then
            brake = 1
            -- force Clutch, Break and Throttle
            physics.forceUserClutchFor(0.1, 0)
            physics.forceUserBrakesFor(0.1,extras.BRAKE_FORCE)
            physics.forceUserThrottleFor(0.1,0)

            -- Print a message to the console
            ac.setMessage('Faster than ' .. extras.MAX_SPEED_LIMIT .. 'km/h!', 'Slow down to '.. extras.BRAKE_TO .. 'km/h')
            if messageSent == 0 then
                ret = ac.sendChatMessage("was faster than the allowed " .. extras.MAX_SPEED_LIMIT .. "km/h")
                ac.debug('Message_sent', ret)
                messageSent = 1
                
            end
            ac.debug('MAX_SPEED_LIMIT', extras.MAX_SPEED_LIMIT)
            ac.debug('BRAKE_TO', extras.BRAKE_TO)
            
        end
    end
end

function script.update()
    checkSpeed()
end