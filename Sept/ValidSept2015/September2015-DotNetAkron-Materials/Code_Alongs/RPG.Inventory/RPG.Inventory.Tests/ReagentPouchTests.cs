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
    public class ReagentPouchTests
    {
        [Test]
        public void CanNotHoldInPouch()
        {
            ReagentPouch bag = new ReagentPouch();

            BattleAxe axe = new BattleAxe();
            bag.AddItem(axe);

            Assert.AreEqual(0, bag.ItemCount);
        }

        [Test]
        public void CanHoldInPouch()
        {
            ReagentPouch bag = new ReagentPouch();

            Mushroom shroom = new Mushroom();
            bag.AddItem(shroom);

            Assert.AreEqual(1, bag.ItemCount);
        }

    }
}
