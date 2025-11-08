
module todolist::todolist {
    use std::string::String;

    public struct ToDoList has key, store {
        id: UID,
        items: vector<String>,
    }

    public fun new(ctx: &mut TxContext) {
      let list = ToDoList {
            id: object::new(ctx),
            items: vector[],
        };

        transfer::transfer(list, tx_context::sender(ctx)); 
    }

    public fun add_item(list: &mut ToDoList, item: String) {
        vector::push_back(&mut list.items, item);
    }

    public fun get_items(list: &ToDoList): vector<String> {
        list.items
    }

}

// id do pacote: 0x23bf809d574e12a7258f8d19922a014bf8fa5200e39f5d59d5e3c343cb3cd22c

