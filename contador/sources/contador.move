module contador::contador {
  use std::debug::print;

  public struct Counter has drop {
    current: u64,
    target: u64,
  }
 
  fun assign(target:u64): Counter{
      Counter {
        current: 0,
        target,
      }
  }

  fun increment(counter: &mut Counter){
    assert!(counter.current < counter.target, 1);
    counter.current = counter.current + 1;
  }


  fun play(counter: &mut Counter){
    while(!(counter.current == counter.target)){
      print(&counter.current);
      increment(counter);
    }
  }

  #[test]
  fun test_main(){
    let mut counter = assign(11);
    play(&mut counter)
  }
}