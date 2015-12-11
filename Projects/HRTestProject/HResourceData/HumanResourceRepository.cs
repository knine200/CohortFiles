using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Cache;
using System.Text;
using System.Threading.Tasks;
using HResourceModel;

namespace HResourceData
{
    public class HumanResourceRepository : IHrepository
    {
        public string RootPath { get; set; }

        private string _fileName
        {
            get { return RootPath + @"DataFiles/Resume.txt"; }
        }


        private string _policyPath
        {

           get { return RootPath + @"DataFiles/Policies.txt"; }

        }





        public List<Resume> GetAll()
        {
            List<Resume> allResumes = new List<Resume>();

            using (var reader = File.OpenText(_fileName))

            {
                reader.ReadLine();

                string inputLine;
                while ((inputLine = reader.ReadLine()) != null)
                {
                    var columns = inputLine.Split('℗');
                    var resume = new Resume()
                    {
                        Id = int.Parse(columns[0]),
                        Name = columns[1],
                        PhoneNumber = columns[2],
                        Email = columns[3],
                        Address = columns[4],
                        Position = columns[5],
                        Background = columns[6],
                        Education = columns[7],
                        DesiredSalary = columns[8],
                        DateOfApplication = columns[9]
                    };
                    allResumes.Add(resume);
                }
            }
            return allResumes;
        }

        public void Add(Resume newResume)
        {
            // ternary operator is saying:
            // if there are any contacts return the max contact id and add 1 to set our new contact id
            // else set to 1
            newResume.Id = (GetAll().Any()) ? GetAll().Max(c => c.Id) + 1 : 1;

            var applicants = GetAll();
            applicants.Add(newResume);

            WriteFile(applicants);
        }

        public void Delete(int id)
        {
            var applicants = GetAll();
            applicants.RemoveAll(c => c.Id == id);

            WriteFile(applicants);
        }

        public void Edit(Resume applicant)
        {
            var applicants = GetAll();
            applicants.RemoveAll(c => c.Id == applicant.Id);
            applicants.Add(applicant);

            WriteFile(applicants);
        }

        public Resume GetById(int id)
        {
            return GetAll().FirstOrDefault(c => c.Id == id);
        }

        private void WriteFile(List<Resume> applicants)
        {

            using (var writer = File.CreateText(_fileName))
            {
                writer.WriteLine(
                    "Id℗Name℗PhoneNumber℗Email℗Address℗Position℗Background℗Education℗DesiredSalary℗DateofApplication");

                foreach (Resume a in applicants)
                {
                    writer.WriteLine(String.Format("{0}℗{1}℗{2}℗{3}℗{4}℗{5}℗{6}℗{7}℗{8}℗{9} ", a.Id, a.Name,
                        a.PhoneNumber, a.Email, a.Address, a.Position, a.Background, a.Education, a.DesiredSalary,
                        a.DateOfApplication));
                }
            }
        }






        public List<Policy> GetAllP()
        {
            List<Policy> allPolicies = new List<Policy>();

            if (File.Exists(_policyPath))
            {
                using (var reader = File.OpenText(_policyPath))
                {
                    //read the header line
                    reader.ReadLine();

                    string inputLine;
                    while ((inputLine = reader.ReadLine()) != null)
                    {
                        var columns = inputLine.Split('℗');
                        var policy = new Policy();
                        policy.CategoryType = new Category();
                        policy.PolicyNo = int.Parse(columns[0]);
                        policy.CategoryType.CategoryType = columns[1];
                        policy.Title = columns[2];
                        policy.Content = columns[3];

                        allPolicies.Add(policy);
                    }
                }
            }

            return allPolicies;

        }




        public void AddP(Policy newPolicy)
        {
            // ternary operator is saying:
            // if there are any contacts return the max contact id and add 1 to set our new contact id
            // else set to 1
            //newPolicy.PolicyNo = (GetAll().Any()) ? GetAll().Max(c => c.Id) + 1 : 1;

            var policies = GetAllP();
            var max = policies.Max(a => a.PolicyNo);
            newPolicy.PolicyNo = max + 1;
            policies.Add(newPolicy);




            WriteFile(policies);
        }

        public void DeleteP(int id)
        {
            var policies = GetAllP();
            policies.RemoveAll(
                c => c.PolicyNo == id);

            WriteFile(policies);
        }

        public void EditP(Policy p)
        {
            var applicants = GetAllP();
            applicants.RemoveAll(c => c.PolicyNo == p.PolicyNo);
            applicants.Add(p);

            WriteFile(applicants);
        }

        public Policy GetByIdP(int id)
        {
            return GetAllP().FirstOrDefault(c => c.PolicyNo == id);
        }

        private void WriteFile(List<Policy> policytype)
        {
            using (var writer = File.CreateText(_policyPath))
            {
                writer.WriteLine("PolicyNo,Category,Title,Content");

                foreach (Policy a in policytype)
                {
                    writer.WriteLine(String.Format("{0}℗{1}℗{2}℗{3} ", a.PolicyNo, a.CategoryType.CategoryType, a.Title,
                        a.Content));
                }
            }
        }

        public List<string> GetCategories()
        {
            var allpolicies = GetAllP();
            var categoryList = allpolicies.Select(c => c.CategoryType.CategoryType).Distinct().ToList();
            return categoryList;
        }


    }
}
