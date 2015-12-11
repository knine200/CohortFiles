using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HResourceModel;

namespace HResourceData
{
    public class MockHrepository: IHrepository
    {
        private List<Policy> _policy = new List<Policy>();
        private bool isFirstLoad1 = false;

        private static List<Resume> _applicants = new List<Resume>();
        private static bool isFirstLoad = false;

        public MockHrepository()
        {
            if (!_applicants.Any() && !isFirstLoad)
            {
                _applicants.AddRange(new List<Resume>()
                {
                    new Resume {Id = 1, Name = "Koshin Abdi", PhoneNumber = "876-5309", Email = "vegetak200@yahoo.com", Address = "100 Main Street", Position = "Manager", Background = "Sales Rep", Education = "MBA", DesiredSalary = "60000", DateOfApplication = "01012015"},
                    new Resume {Id = 2, Name = "Patrick Beauchamp", PhoneNumber = "511-6199", Email = "patty.beauchamp@gmail.com", Address = "401 South Main St.", Position = "Professor", Background = "Teacher", Education = "PHD", DesiredSalary = "90000", DateOfApplication = "07102015"}
                });
                isFirstLoad = true;
            }
        }

        public List<Resume> GetAll()
        {
            return _applicants;
        }

        public void Add(Resume newResume)
        {
            // ternary operator is saying:
            // if there are any contacts return the max contact id and add 1 to set our new contact id
            // else set to 1
            newResume.Id = (_applicants.Any()) ? _applicants.Max(c => c.Id) + 1 : 1;

            _applicants.Add(newResume);
        }

        public void Delete(int id)
        {
            _applicants.RemoveAll(c => c.Id == id);
        }

        public void Edit(Resume resume)
        {
            Delete(resume.Id);
            _applicants.Add(resume);
        }

        public Resume GetById(int id)
        {
            return _applicants.FirstOrDefault(c => c.Id == id);
        }




        //public MockHrepository(string a)
        //{
        //    if (!_policy.Any() && !isFirstLoad1)
        //    {
        //        _policy.AddRange(new List<Policy>()
        //        {
        //            new Policy {PolicyNo = 1, Category = "Dress", Title = "DressPolicy", Content = "No flip flops for Tuesday's ever!"},
        //            new Policy {PolicyNo = 2, Category = "LeaveOfAbsence", Title = "Absence", Content = "Only death allowed!"}
        //        });
        //        isFirstLoad1 = true;
        //    }
        //}

        public List<Policy> GetAllP()
        {
            return _policy;
        }

        public void AddP(Policy newPolicy)
        {
            // ternary operator is saying:
            // if there are any contacts return the max contact id and add 1 to set our new contact id
            // else set to 1
            newPolicy.PolicyNo = (_policy.Any()) ? _policy.Max(c => c.PolicyNo) + 1 : 1;

            _policy.Add(newPolicy);
        }

        public void DeleteP(int id)
        {
            _policy.RemoveAll(c => c.PolicyNo == id);
        }

        public void EditP(Policy p)
        {
            Delete(p.PolicyNo);
            _policy.Add(p);
        }

        public Policy GetByIdP(int id)
        {
            return _policy.FirstOrDefault(c => c.PolicyNo == id);
        }
    }


}





