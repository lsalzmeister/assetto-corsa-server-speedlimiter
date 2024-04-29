local messageSent = 0
local brake = 0

local MAX_SPEED_LIMIT = 74
local BRAKE_TO = 65
local BRAKE_FORCE = 0.2

function checkSpeed()
    -- Get the player's car speed
    local carSpeed = ac.getCar(carIndex).speedKmh
    if carSpeed then
        ac.debug('Speed', carSpeed)
        -- if car slowed down, disable braking and reset message
        if carSpeed < BRAKE_TO and brake == 1 then
            brake =  0
            messageSent = 0
        end
        -- Check if the speed is above the speed limit or braking is active
        if carSpeed > MAX_SPEED_LIMIT or brake == 1 then
            brake = 1
            -- force Clutch, Break and Throttle
            physics.forceUserClutchFor(0.1, 0)
            physics.forceUserBrakesFor(0.1,BRAKE_FORCE)
            physics.forceUserThrottleFor(0.1,0)

            -- Print a message to the console
            ac.setMessage('Faster than ' .. MAX_SPEED_LIMIT .. 'km/h!', 'Slow down to '.. BRAKE_TO .. 'km/h')
            if messageSent == 0 then
                ret = ac.sendChatMessage("was faster than the allowed " .. MAX_SPEED_LIMIT .. "km/h")
                ac.debug('Message_sent', ret)
                messageSent = 1
                
            end
            ac.debug('MAX_SPEED_LIMIT', MAX_SPEED_LIMIT)
            ac.debug('BRAKE_TO', BRAKE_TO)
            
        end
    end
end

function script.update()
    checkSpeed()
end