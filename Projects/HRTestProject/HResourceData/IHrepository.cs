using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HResourceModel;

namespace HResourceData
{
    public interface IHrepository
    {
        List<Resume> GetAll();
        void Add(Resume newResume);
        void Delete(int id);
        void Edit(Resume contact);
        Resume GetById(int id);
    }
}
