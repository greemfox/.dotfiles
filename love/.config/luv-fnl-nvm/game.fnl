(local repl (require "lib.stdio"))

(global state {})

(fn love.load []
  (repl.start)
  (set state.x 420)
  (set state.y 69)
  (set state.r 5)
  (set state.speed 1))

(fn love.update [dt]
  (let [isDown love.keyboard.isDown
        delta (* state.speed dt)]
    (set state.r (* 50 (math.abs (math.sin (love.timer.getTime)))))))

(fn love.draw []
  (love.graphics.circle :fill
                        state.x
                        state.y
                        state.r))
