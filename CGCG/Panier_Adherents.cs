﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CGCG
{
    public class Panier_Adherents
    {
        public int id { get; set; }

        public int id_adherents { get; set; }

        public int id_panier_global { get; set; }

        public Panier_Adherents(int ID_adherents, int ID_panier_global)
        {
            id_adherents = ID_adherents;
            id_panier_global = ID_panier_global;
        }

        public Panier_Adherents(int ID, int ID_adherents, int ID_panier_global)
            :this(ID_adherents, ID_panier_global)
        {
            id = ID;
        }
    }
}
