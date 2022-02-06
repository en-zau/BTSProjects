﻿using System;
using System.Collections.Generic;

namespace CGCG.DAL
{
    interface IDepot_DAL<Type_DAL>
    {
        public string ChaineDeConnexion { get; set; }

        public List<Type_DAL> GetAll();

        public Type_DAL GetByID(int ID);

        public Type_DAL Insert(Type_DAL item);

        public Type_DAL Update(Type_DAL item);

        public void Delete(Type_DAL item);
    }
}
