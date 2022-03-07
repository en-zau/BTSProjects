﻿using CGCG.DTO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CGCG.API.Controllers
{
    [ApiController]
    [Route("[controller]")]

    public class ReferenceController : ControllerBase
    {
        private IReferencesService service;
        private IFournisseurs_ReferencesService fournisseurs_ReferencesService;

        public ReferenceController(IReferencesService srv, IFournisseurs_ReferencesService srvFourRef)
        {
            service = srv;
            fournisseurs_ReferencesService = srvFourRef;
        }

        [HttpGet("AllReference")]
        public IEnumerable<Reference_DTO> GetAllReference()
        {
            return service.GetAllReferences().Select(r => new Reference_DTO()
            {
                id = r.id,
                reference = r.reference,
                libelle = r.libelle,
                marque = r.marque,
                desactive = r.desactive,
                id_fournisseurs = r.id_fournisseurs,
            });
        }

        [HttpGet("{idReference}")]
        public Reference_DTO GetIDReference([FromRoute] int idReference)
        {
            var r = service.GetReferencesByID(idReference);
            return new Reference_DTO()
            {
                id = r.id,
                reference = r.reference,
                libelle = r.libelle,
                marque = r.marque,
                desactive = r.desactive,
                id_fournisseurs = r.id_fournisseurs,
            };
        }
        [HttpPut]
        public Reference_DTO GetPutReference(Reference_DTO r)
        {
            var r_metier = service.Update(new References(r.id, r.reference, r.libelle, r.marque, r.desactive, r.id_fournisseurs));
            r.id = r_metier.id;
            r.reference = r_metier.reference;
            r.libelle = r_metier.libelle;
            r.marque = r_metier.marque;
            r.desactive = r_metier.desactive;
            r.id_fournisseurs = r_metier.id_fournisseurs;
            return r;

        }

        [HttpPost]
        public Reference_DTO Insert(Reference_DTO r)
        {
            var r_metier = service.Insert(new References(r.reference, r.libelle, r.marque, r.desactive));
            //Je récupère l'ID
            r.id = r_metier.id;
            //je renvoie l'objet DTO

            foreach (var id in r.id_fournisseurs)
            {
                fournisseurs_ReferencesService.Insert(new Fournisseurs_References(id, r.id));
            }
            return r;
        }

        [HttpDelete]
        public void DeleteRef(int id)
        {
            var r_metier = service.GetReferencesByID(id);

            service.Delete(r_metier);
        }


        /*[HttpPost("ImportCSV")]
        public void ImportCSV(string[] referencesCSV, int idFournisseur)
        {
            Fournisseurs_ReferencesService.Delete(idFournisseur); //on supprime toutes les anciennes références proposés

            for (var i = 1; i < referencesCSV.Length - 1; i++) // on itère sur chaque ligne
            {
                var referenceCSV = referencesCSV[i].Split(";"); //on split la ligne en fonction des ;

                var referenceBDD = service.GetByReference(referenceCSV[0]);

                if (referenceBDD.Count > 0) //si la référence existe déjà en base de donnée
                {
                    serviceReferenceDetail.Insert(new Reference_details(idFournisseur, referenceBDD[0].ID));
                }
                else //si la référence n'existe pas en base de donnée
                {
                    var referenceTmp = service.Insert(new Reference(referenceCSV[0], referenceCSV[1], referenceCSV[2]));
                    serviceReferenceDetail.Insert(new Reference_details(idFournisseur, referenceTmp.ID));
                }
            }
        }*/
    }
}
