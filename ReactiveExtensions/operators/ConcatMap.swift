import ReactiveSwift

public extension SignalProtocol {

  
  public func concatMap <U> (_ f: @escaping (Value) -> SignalProducer<U, Error>) -> Signal<U, Error> {
    return self.signal.flatMap(.concat, transform: f)
  }

  
  public func concatMap <U> (_ f: @escaping (Value) -> Signal<U, Error>) -> Signal<U, Error> {
    return self.signal.flatMap(.concat, transform: f)
  }
}

public extension SignalProducerProtocol {

  
  public func concatMap <U> (_ f: @escaping (Value) -> SignalProducer<U, Error>) -> SignalProducer<U, Error> {
    return self.producer.flatMap(.concat, transform: f)
  }

  
  public func concatMap <U> (_ f: @escaping (Value) -> Signal<U, Error>) -> SignalProducer<U, Error> {
    return self.producer.flatMap(.concat, transform: f)
  }
}
