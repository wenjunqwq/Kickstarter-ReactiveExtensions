import ReactiveSwift

public extension SignalProtocol {

  /**
   Debounces a signal by a time interval. The resulting signal emits a value only when `interval` seconds
   have passed since the last emission of `self`.

   - parameter interval:  The time to wait since last emission.
   - parameter scheduler: A scheduler.

   - returns: A new signal.
   */
  
  public func ksr_debounce(
    _ interval: @autoclosure @escaping () -> TimeInterval,
    onScheduler scheduler: @autoclosure @escaping () -> DateSchedulerProtocol) -> Signal<Value, Error> {

      return self.flatMap(.latest) { next in
        SignalProducer(value: next).delay(interval(), on: scheduler())
      }
  }
}

public extension SignalProducerProtocol {

  /**
   Debounces a producer by a time interval. The resulting producer emits a value only when `interval` seconds
   have passed since the last emission of `self`.

   - parameter interval:  The time to wait since last emission.
   - parameter scheduler: A scheduler.

   - returns: A new producer.
   */
  
  public func ksr_debounce(
    _ interval: @autoclosure @escaping () -> TimeInterval,
    onScheduler scheduler: @autoclosure @escaping () -> DateSchedulerProtocol) -> SignalProducer<Value, Error> {

      return lift { $0.ksr_debounce(interval(), onScheduler: scheduler()) }
  }
}
