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
    public class SatchelTests
    {
        [Test]
        public void CanNotAddBigItem()
        {
            Satchel bag = new Satchel();

            BattleAxe axe = new BattleAxe();
            bag.AddItem(axe);

            Assert.AreEqual(0, bag.ItemCount);
        }

        [Test]
        public void CanAddLittleItem()
        {
            Satchel bag = new Satchel();

            Mushroom shroom = new Mushroom();
            bag.AddItem(shroom);

            Assert.AreEqual(1, bag.ItemCount);
        }
    }
}
