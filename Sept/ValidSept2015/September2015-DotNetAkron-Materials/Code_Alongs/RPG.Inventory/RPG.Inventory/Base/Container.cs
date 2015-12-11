using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RPG.Inventory.Base
{
    public abstract class Container : Item
    {
        protected int _capacity;
        protected int _currentIndex;
        protected Item[] _ItemsInBag;

        public Container(int capacity)
        {
            _capacity = capacity;
            _ItemsInBag = new Item[_capacity];
            _currentIndex = 0;

            Type = ItemType.Container;
        }

        public virtual void AddItem(Item itemToAdd)
        {
            _ItemsInBag[_currentIndex] = itemToAdd;
            _currentIndex++;
        }

        public virtual Item RemoveItem()
        {
            _currentIndex--;

            Item itemToRemove = _ItemsInBag[_currentIndex];

            _ItemsInBag[_currentIndex] = null;

            return itemToRemove;
        }

        public virtual void DisplayContents()
        {
            Console.WriteLine("Items in bag: ");

            foreach (Item item in _ItemsInBag)
            {
                if (item != null)
                {
                    Console.WriteLine(item);
                }
            }
        }

        public int ItemCount { get { return _currentIndex; } }
    }
}
