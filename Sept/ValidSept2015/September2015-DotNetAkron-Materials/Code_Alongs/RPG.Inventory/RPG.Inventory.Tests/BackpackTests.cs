using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using RPG.Inventory.Containers;
using RPG.Inventory.Reagents;
using RPG.Inventory.Weapons;

namespace RPG.Inventory.Tests
{
    [TestFixture]
    public class BackpackTests
    {
        [Test]
        public void PutItemsInBackpackTest()
        {
            Backpack bag = new Backpack();

            Mushroom shroom = new Mushroom();
            Cloth cloth = new Cloth();
            BattleAxe axe = new BattleAxe();

            bag.AddItem(shroom);
            bag.AddItem(cloth);
            bag.AddItem(axe);

            Assert.AreEqual(3, bag.ItemCount);

            bag.DisplayContents();
        }
    }
}
