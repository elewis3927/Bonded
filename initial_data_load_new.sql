DROP TABLE PRODUCT_IMAGE;
DROP TABLE PRODUCT;
DROP TABLE EVENT;
DROP TABLE USER;
DROP TABLE FEATURED_PRODUCT;
DROP TABLE ADMIN;
DROP TABLE GALLERY;
USE bondedDB;

CREATE TABLE PRODUCT(
  name VARCHAR (256) NOT NULL,
  description TEXT NOT NULL,
  category VARCHAR (256) NOT NULL,
  vendor VARCHAR (256) NOT NULL,
  pid INT AUTO_INCREMENT NOT NULL,
  PRIMARY KEY (pid)
);

CREATE TABLE GALLERY(
  name VARCHAR (256) NOT NULL,
  description TEXT NOT NULL,
  gallery_path VARCHAR(256) NOT NULL,
  gid INT AUTO_INCREMENT NOT NULL,
  PRIMARY KEY (gid)
);

CREATE TABLE EVENT(
  name VARCHAR (256) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR (256) NOT NULL,
  day VARCHAR (256) NOT NULL,
  specifiedtime VARCHAR (256) NOT NULL,
  eid INT AUTO_INCREMENT NOT NULL,
  PRIMARY KEY (eid)
);

CREATE TABLE USER(
  uid INT AUTO_INCREMENT NOT NULL,
  username VARCHAR (256) NOT NULL,
  password VARCHAR(256) NOT NULL,
  PRIMARY KEY(uid)
);

CREATE TABLE PRODUCT_IMAGE(
  iid INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(256) NOT NULL,
  image_path VARCHAR(256) NOT NULL,
  product_id INT NOT NULL,
  PRIMARY KEY(iid),
  FOREIGN KEY(product_id) REFERENCES PRODUCT(pid)
);

CREATE TABLE FEATURED_PRODUCT(
  fid INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(256) NOT NULL,
  description VARCHAR(256) NOT NULL,
  image_path VARCHAR(256) NOT NULL,
  image_height INT NOT NULL,
  image_width INT NOT NULL,
  PRIMARY KEY(fid)
);

CREATE TABLE ADMIN(
  aid INT AUTO_INCREMENT NOT NULL,
  username VARCHAR(256) NOT NULL,
  password VARCHAR(256) NOT NULL,
  PRIMARY KEY(aid)
);


INSERT INTO ADMIN (username, password) VALUES ("Zack", "Rossman");

INSERT INTO ADMIN (username, password) VALUES ("Ethan", "Lewis");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES ("Hawaiian Cement", "Portland 94 lb. Hawaiian Cement may be used to make concrete, mortar and stucco Mixes. It is a fine dry powder meeting ASTM C150 Type I/II. Portland 94 lb. Hawaiian Cement is locally packaged globally sourced. Please contact Hawaiian Cement for further information", "Concrete Repair", "Hawaiian Cement");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Hawaiian Cement - Ultramortar", "Used to make mortar for laying brick, block, and stone. Rock walls, cement block construction, brick wall are examples of its usage. Comparable to Quikrete Mason and Mortar mix. Please contact Hawaiian Cement for further information", "Concrete Repair", "Hawaiian Cement");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Lehigh White Cement", "Lehigh White Type I Portland Cement is recommended for general architectural applications, such as; precast and prestressed architectural concrete, cast-in-place architectural and structural concrete, architectural concrete masonry, swimming pools and spas, colored mortars, ornamental statuary, reflective floors, floor tiles and pavers, cast stone, terrazzo, tile grout, glass fiber reinforced concrete products, concrete countertops, concrete roof tiles, traffic calming and delineation, median barriers, bridge parapets, sound walls, retaining walls, tunnel construction and reflective concrete paving. Lehigh White Type I Portland Cement may be used as a base to produce vibrant and true colors prized in almost any architectural concrete application.", "Concrete Repair" , "Lehigh");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.lehighwhitecement.com/products/Documents/LWCC%20Masonry%20Cement%20TechData%20Sheet.pdf", 3);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.lehighwhitecement.com/support/Documents/SDS%20LWCC%20Portland%20Cement-2017.pdf", 3);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Lumnite MG", "LUMNITE MG is a fused, low purity calcium alumi-nate (CA) cement designed to contribute special properties in materials for the building chemistry, construction, and related applications. Typically this product is used as a refractory cement.", "Concrete Repair" , "Lumnite");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.calucem.com/fileadmin/downloads/technical_datasheets/TD_Lumnite-MG_EN.pdf", 4);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://www.calucem.com/fileadmin/downloads/safety_datasheets/SD_LUMNITE_Refcon_MG_EN_CAN.pdf", 4);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapecem 102", "Medium-Build, One-Component, Fast-Setting Mortar<br><br>Mapecem 102 is a one-component, shrinkage-compensated, polymer-modified, fast-setting cementitious mortar with a corrosion inhibitor and silica fume. Mapecem 102 is intended for the renovation and topping of interior/exterior horizontal concrete surfaces, such as tunnels, bridges, overpasses, factory floors, warehouse floors and loading docks; new and existing concrete slabs; and the construction of floating or monolithic toppings where fast drying is required to allow traffic within 4 hours.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/product-detail.asp?IDTipo=11455&IDLinea=101&IDMacroLinea=0&IDProdotto=100170", 5);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapecem Quikpatch", "High-Performance Concrete Patch<br><br>Mapecem Quickpatch is a high-performance, fast-setting, cementitious material used for the patching of concrete surfaces.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Patching-and-Skimcoating-Compounds/Mapecem--Quickpatch", 6);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapecrete Film", "Evaporation Retardant and Finishing Aid<br><br>Mapecrete Film is designed to retard moisture evaporation on concrete surfaces and aid in finishing of concrete flatwork. Mapecrete Film forms a thin film to prevent rapid moisture loss on newly placed concrete surfaces and is particularly effective when concrete is placed in areas with direct sun, low humidity, high winds or high temperatures. Diluted with water, Mapecrete Film is sprayed on fresh concrete to aid in preventing plastic shrinkage and potential cracking.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Cure-and-Seals/Mapecrete-Film", 7);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapecrete Hard SI", "Sodium Silicate Densifier for Concrete<br><br>Mapecrete Hard SI is a clear, water-based sodium silicate densifier used to harden and dustproof concrete surfaces. It chemically reacts with the free lime and calcium carbonate in concrete, forming a dense, insoluble and chemically resistant surface. Mapecrete Hard SI is a VOC-free, colorless and odorless chemical solution that may be applied to horizontal interior, fresh or hardened concrete. Floors treated with Mapecrete Hard SI resist the penetration of water, oil and chemicals.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Densifiers/Mapecrete-Hard-SI", 8);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapecure DR", "Water-Based, Dissipating-Resin Curing Compound.<br><br>Mapecure DR is a water-based, liquid, membrane-forming curing compound for freshly placed concrete. Formulated from specially selected dissipating hydrocarbon resins, it is designed to retain water in the concrete for proper hydration, and then to begin breaking down and deteriorating when exposed to traffic, sunlight and weathering.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Cure-and-Seals/Mapecure-DR", 9);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapefer 1k", "Corrosion-Inhibiting Coating for Reinforcing Steel<br><br>Mapefer 1K is a one-component, anti-corrosion coating based on unique polymers, cementitious binders and corrosion inhibitors. Mapefer 1K is specially formulated for application on properly prepared reinforcing steel  to inhibit oxidation and rust formation.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Products-for-Structural-Strengthening/Corrosion-Protection/MAPEFER-1K", 10);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Eco Prim Grip", "Multipurpose Bond-Promoting Primer<br><br>ECO Prim Grip is a ready-to-use, low-VOC, synthetic resin-based primer with bond-promoting silica aggregates suspended in a dispersion. It enhances the performance and adhesion of mortars to existing ceramics and difficult-to-bond-to substrates. Plus, it improves bonding of self-leveling underlayments (SLUs) and bonds of render coats over cementitious substrates. Suitable for a wide variety of substrates, ECO Prim Grip combines excellent versatility with an easy, low-odor application.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Tile-&-Stone-Installation-Systems/Bond-Promoting-Primer/ECO-Prim-Grip", 11);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Keraset Thinset", "Professional Tile Mortar<br><br>Keraset is a dry-set mortar for use in interior/exterior residential and light commercial floor and wall applications.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Tile-&-Stone-Installation-Systems/Dry-Set-Mortars/Keraset", 12);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Novoplan 2 Plus", "Professional Self-Leveling Underlayment<br><br>Novoplan 2 Plus is a high-strength, self-leveling cement-based underlayment and repair mix with quicker curing time, for interior concrete and engineer-approved floors.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Tile-&-Stone-Installation-Systems/Self-Leveling-Underlayments/Novoplan-2-Plus", 13);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planibond EBA", "High-Modulus Epoxy Bonding Agent<br><br>Planibond EBA is a two-component, multipurpose, high-modulus epoxy bonding agent. Planibond EBA is nonshrink, 100%-solids and moisture-tolerant. Planibond EBA is used primarily as a bonding agent for screeds and repair mortars.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/product-detail.asp?IDTipo=11460&IDLinea=101&IDMacroLinea=0&IDProdotto=10010103", 14);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planicrete AC", "Acrylic Latex Admixture for Mortar and Concrete<br><br>Planicrete AC is a one-component, concentrated liquid latex admixture used to enhance the performance of cementitious repair mortars, plasters, stuccos, concrete mixes and toppings for the restoration of horizontal, vertical and overhead concrete; concrete masonry units (CMUs); and masonry surfaces.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Admixtures/Planicrete-AC", 15);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planiseal MSP", "Moisture-Control Membrane, Adhesive Isolator, Sealer, pH Blocker and Primer.<br><br>Planiseal MSP is a two-coat, high-solids, polymer-based adhesive isolator, sealer, moisture-control membrane and self-leveling primer. Planiseal MSP protects flooring installations against subfloor moisture and pH in concrete slabs with moisture vapor emission rates (MVERs) up to 15 lbs. (6,80 kg) per ASTM F1896, relative humidity (RH) up to 99% per ASTM F2170 and alkalinity protection up to pH of 12. Planiseal MSP eliminates the need for a secondary primer for self-leveling applications.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/product-detail.asp?IDTipo=11488&IDLinea=103&IDMacroLinea=0&IDProdotto=2028302058", 16);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planiseal VS", "Alkali-Resistant, Epoxy Moisture-Reduction Barrier<br><br>Planiseal VS is an alkali-resistant, two-component, 100%-solids epoxy coating that effectively stops moisture-related problems with floor coverings. In addition, Planiseal VS expedites floor-covering installations by eliminating the traditional wait time required for new concrete slabs to reach moisture levels suitable for installations.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Floor-Covering-Installation-Systems/Moisture-Control-Products/Planiseal-VS", 17);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planitop 11 SCC", "Self-Consolidating Concrete Mix with Corrosion Inhibitor<br><br>Planitop 11 SCC is a one-component, cementitious, self-consolidating, polymer-modified, concrete mix with silica fume and corrosion inhibitor for full-depth structural concrete repairs in above-, below- and on-grade applications. Planitop 11 SCC is pre-extended with coarse aggregate and specially designed for large-volume, horizontal structural repairs from 1"" to 8"" (2,5 to 20 cm) in thickness, and is suitable for form-and-pour and form-and-pump applications on vertical and overhead applications. Planitop 11 SCC is ideal for structural repairs in applications such as tunnels, bridges, dams, parking garages, balcony edges and columns.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Concrete-Repair-Mortars/Planitop-11-SCC", 18);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planitop 15", "Form-and-Pour, One-Component Repair Mortar<br><br>Planitop 15 is a one-component, shrinkage-compensated, cementitious, fiber-reinforced, fluid mortar. Planitop 15 contains a corrosion inhibitor and silica fume, and is well-suited for form-and-pour and form-and-pump applications where high early strength and flowability are required.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Concrete-Repair-Mortars/Planitop-15", 19);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planitop 18", "Very Rapid-Hardening Repair Mortar.<br><br>Planitop 18 is a very rapid-hardening repair mortar that exhibits high early strength and provides quick return to service.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Concrete-Repair-Mortars/Planitop-18", 20);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planitop 18 TG", "Very Rapid-Hardening, Trowel-Grade, High-Early-Strength Repair Mortar<br><br>Planitop 18 TG is a one-component, shrinkage-compensated, very rapid-hardening, trowel-grade, cementitious repair mortar with a corrosion inhibitor. Planitop 18 TG gains strength rapidly and is particularly suited for all horizontal concrete repairs from 1/2/"" to 2"" (12 mm to 5 cm) thickness when applied neat and up to 8"" (20 cm) when extended with aggregate.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/product-detail.asp?IDTipo=11455&IDLinea=101&IDMacroLinea=0&IDProdotto=2028302063", 21);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planitop 23", "Vertical and Overhead Two-Component Repair Mortar<br><br>Planitop 23 is a two-component, fast-setting, polymer-modified, thixotropic, fiber-reinforced cementitious mortar, with a corrosion inhibitor. Planitop 23 is intended for vertical and overhead repairs, and contains silica fume to provide a durable, high-strength mortar in these applications.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Concrete-Repair-Mortars/Planitop-23", 22);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planitop X", "One-Component, Fast-Setting, Fiber-Reinforced, Vertical and Overhead Repair Mortar<br><br>Planitop X is a one-component, fiber-reinforced, shrinkage-compensated, high-early-strength, fast-setting, polymer-modified, high-build cementitious repair mortar with a corrosion inhibitor.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Concrete-Repair-Mortars/Planitop-X", 23);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planitop XS", "One-Component, Fast-Setting, Extended-Working-Time, Vertical and Overhead Repair Mortar<br><br>Planitop XS is an extended-working-time variation of Planitop X. Shrinkagecompensated, fiber-reinforced, polymer-modified and containing a proprietary corrosion inhibitor, Planitop XS features Planitop X''s outstanding workability and versatility. Ideal for a wide variety of vertical and overhead concrete repairs, Planitop XS can be applied from featheredge to 4"" (10 cm) per lift. Planitop XS dries to a light gray color, blending well with most concrete surfaces.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Concrete-Repair-Mortars/Planitop-XS", 24);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Primer L", "Advanced-Technology, Acrylic Latex Primer for Concrete<br><br>Primer L is a concentrated, solvent-free acrylic primer used before the installation of underlayment materials. It is green for easy identification. Primer L improves the bond between a properly prepared and profiled concrete substrate, and self-leveling underlayment. Primer L can also be used as a primer for gypsum-based underlayments and patches.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Primers-for-Self-Leveling/Primer-L", 25);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Primer T", "All-Purpose Primer for Self-Leveling Underlayments<br><br>Primer T is a low-VOC, water-based acrylic primer that enhances the performance and adhesion of self-leveling underlayments (SLUs) on nonabsorbent surfaces such as ceramic tile, vinyl composition tile (VCT), epoxy moisture barriers and adhesive residue, as well as profiled, absorbent surfaces. Suitable for a wide variety of substrates, Primer Tcombines excellent versatility with an easy, low-odor application.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Primers-for-Self-Leveling/Primer-T", 26);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Tilt Finish", "Smoothing and Finishing Compound for Concrete Surfaces.<br><br>Tilt Finish is a versatile, fast-setting, polymer-modified material utilizing a proprietary blend of cements and additives. It is ideal for producing a smooth finish on concrete surfaces before application of paint or coatings.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Patching-and-Skimcoating-Compounds/Tilt-Finish", 27);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Ultraflex 1", "Standard Tile Mortar with Polymer<br><br>Ultraflex 1 is a standard-grade, single-component, polymer-modified thin-set mortar for most interior and exterior installations of tile. This mortar has an above average content of unique dry polymer, resulting in good adhesion to the substrate and tile. Ultraflex 1 can be used for both interior and exterior installations of tile in most residential floor and wall applications. In commercial applications, use on interior floor and wall installations and exterior floors.  Ultraflex 1 meets or exceeds ANSI A118.4 and ANSI A118.11 requirements when mixed with water.", "Concrete Repair", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Tile-&-Stone-Installation-Systems/Polymer-Modified-Mortars/Ultraflex-1", 28);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MasterEmaco N 426 (Formerly: Thorite Rapid Vertical)", "MasterEmaco N 426 is a one component fast-setting polymermodified Portland-cement-based repair mortar for vertical and overhead concrete and masonry surfaces. It is formulated to provide excellent resistance to wind-driven rain, prolonged moisture, and freeze/thaw cycles.", "Concrete Repair", "Master Builders Solutions");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/masteremaco/masteremaco-n-426", 29);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Masterseal 590 (Formerly: Waterplug)", "MasterSeal 590 is a one-component, quick-setting, portland-cement-based hydraulic repair mortar that instantly stops running water through holes or cracks in concrete or masonry. It expands as it sets to lock into place even under constant water pressure.", "Concrete Repair", "Master Builders Solutions");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/masterseal/masterseal-590", 30);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Pro Crylic", "PRO-CRYLIC is an acrylic polymer liquid admixture designed to improve the adhesion and other physical properties of portland cement mortar, plaster and concrete.", "Concrete Repair", "Bonded Materials");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Pro Finish", "PRO-FINISH is a cement based, poly-modified, quick-setting, concrete finishing material. It is a dry powder blend of portland cement and specialized additives designed specifically for application to concrete surfaces when a Class A finish is desired.", "Concrete Repair", "Bonded Materials");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Pro Pak Asphalt Patch", "PRO-PAK Asphalt Repair is a cold applied high performance asphalt repair designed for repairing potholes over 1"" in depth in asphalt pavements. Use in driveways, parking lots, walkways etc.", "Concrete Repair", "Bonded Materials");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Pro Surface", "PRO-SURFACE is a two-component, acrylic polymer modified cementitious product, for use as a resurfacing underlayment or as a finished floor coating. PRO-SURFACE is a liquid acrylic polymer and PRO-SURFACE POWDER is a select blend of portland cements and silica sand. Its adhesion and flexibility characteristics allow application to a wide variety of surfaces to produce a new, bondable surface compatible with essentially all types of adhesives and coatings.", "Concrete Repair", "Bonded Materials");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Pro Surface 90QS", "PRO-SURFACE 90QS is a high performance, two-component, polymer-modified concrete repair mortar. Part A consists of a polymer liquid called ""PRO-SURFACE."" Part B consists of a pre-bagged mixture of quick-setting cement and specially graded sand called ""90QS."" When these two parts are mixed together they form a flexible, fast drying, high-strength repair mortar that can be subjected to vehicular traffic as soon as forty minutes after placement. Depending on the consistency of the mixture, PRO-SURFACE 90QS can be applied in thicknesses of featheredge to 10"" per lift; however, over 2"" it must be extended with 3/8"" pea gravel.", "Concrete Repair", "Bonded Materials");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete 5000 Concrete Mix", "QUIKRETE 5000 Concrete Mix is a commercial grade blend of stone or gravel, sand and cement specially designed for higher early strength. According to ASTM C39, at 28 days, this concrete mix reaches a compressive strength of 5000 psi.", "Concrete Repair", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/quikrete5000concretemix.asp", 36);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete Anchoring Cement", "Exterior Use is a rapid-setting, high strength, shrinkage compensated, commercial grade construction product suitable for use in continuously wet environments. This product expands slightly as it hardens, to fill voids and lock itself securely into place. This product is suitable for use with appliances, bolts, motors, posts, hooks, handrails, conveyors, pipes and conduits. Also may be used for fences, parking meters, columns, ornamental iron work, seats, signs, rods, racks, and door stops.", "Concrete Repair", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/anchoringcement.asp", 37);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete Concrete Bonding Adhesive", "QUIKRETE Concrete Bonding Adhesive is specifically formulated for permanently bonding new concrete or plaster to old concrete or plaster. It is suitable for interior or exterior applications. QUIKRETE Concrete Bonding Adhesive is also used as the required primer for QUIKRETE Self- Leveling Floor Resurfacer.", "Concrete Repair", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/concretebondingadhesive.asp", 38);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete Core-Fill Grout", "Quikrete CORE-FILL GROUT is contractor-grade masonry mortar and grout designed for building and reinforcing walls made of brick, block or stone.", "Concrete Repair", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/corefillmasonrygrout.asp", 39);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete Countertop Mix", "QUIKRETE Countertop Mix is a flowable, high strength commercial grade concrete mix designed for use in concrete countertops, requiring only the addition of water.", "Concrete Repair", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/countertopmix.asp", 40);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete Fast Setting Concrete Mix", "QUIKRETE Fast Setting Concrete Mix is used for setting posts, sleeves and anchors, for pouring slabs 2"" (51 mm) or thicker, and for other applications where a fast-setting general purpose concrete is desirable.", "Concrete Repair", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/fastsettingconcretemix.asp", 41);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete Hydraulic Waterstop", "QUIKRETE Hydraulic Water-Stop Cement is a rapid setting, high strength repair material designed to plug leaks instantly in concrete and masonry.", "Concrete Repair", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/hydraulicwaterstopcement.asp", 42);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete Non-Shrink Precision Grout", "QUIKRETE Non-Shrink Precision Grout is a high strength, non-metallic, Portland cement based material with expansive additives designed for grouting all types of machinery, steel columns, bearing plates, pre-cast concrete, and anchoring applications.", "Concrete Repair", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/nonshrinkprecisiongrout.asp", 43);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete Quick-Setting Cement", "QUIKRETE Quick-Setting Cement is a Portland cement based formula that is specially formulated for making structural repairs to vertical and overhead surfaces.", "Concrete Repair", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/quicksettingcement.asp", 44);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete Scratch & Brown Base Coat Stucco", "QUIKRETE Scratch and Brown Base Coat Stucco is a Portland cement-based stucco designed to be used as the scratch and/or brown coat in a 3-coat stucco application, or the first coat in a 2-coat application.", "Concrete Repair", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/stuccoscratchandbrownbasecoat.asp", 45);

/**************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Eco Prim Grip", "Multipurpose Bond-Promoting Primer<br><br>ECO Prim Grip is a ready-to-use, low-VOC, synthetic resin-based primer with bond-promoting silica aggregates suspended in a dispersion. It enhances the performance and adhesion of mortars to existing ceramics and difficult-to-bond-to substrates. Plus, it improves bonding of self-leveling underlayments (SLUs) and bonds of render coats over cementitious substrates. Suitable for a wide variety of substrates, ECO Prim Grip combines excellent versatility with an easy, low-odor application.", "Tile Setting", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Tile-&-Stone-Installation-Systems/Bond-Promoting-Primer/ECO-Prim-Grip", 46);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Keraset Thinset", "
Professional Tile Mortar<br><br>Keraset is a dry-set mortar for use in interior/exterior residential and light commercial floor and wall applications.", "Tile Setting", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Tile-&-Stone-Installation-Systems/Dry-Set-Mortars/Keraset", 47);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Novoplan 2 Plus", "Professional Self-Leveling Underlayment<br><br>Novoplan 2 Plus is a high-strength, self-leveling cement-based underlayment and repair mix with quicker curing time, for interior concrete and engineer-approved floors.", "Tile Setting", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Tile-&-Stone-Installation-Systems/Self-Leveling-Underlayments/Novoplan-2-Plus", 48);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planicrete AC", "Acrylic Latex Admixture for Mortar and ConcretePlanicrete AC is a one-component, concentrated liquid latex admixture used to enhance the performance of cementitious repair mortars, plasters, stuccos, concrete mixes and toppings for the restoration of horizontal, vertical and overhead concrete; concrete masonry units (CMUs); and masonry surfaces.", "Tile Setting", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Admixtures/Planicrete-AC", 49);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planiseal MSPs", "Moisture-Control Membrane, Adhesive Isolator, Sealer, pH Blocker and Primer<br><br>Planiseal MSP is a two-coat, high-solids, polymer-based adhesive isolator, sealer, moisture-control membrane and self-leveling primer. Planiseal MSP protects flooring installations against subfloor moisture and pH in concrete slabs with moisture vapor emission rates (MVERs) up to 15 lbs. (6,80 kg) per ASTM F1896, relative humidity (RH) up to 99% per ASTM F2170 and alkalinity protection up to pH of 12. Planiseal MSP eliminates the need for a secondary primer for self-leveling applications.", "Tile Setting", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/product-detail.asp?IDTipo=11488&IDLinea=103&IDMacroLinea=0&IDProdotto=2028302058", 50);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Planiseal VS", "Alkali-Resistant, Epoxy Moisture-Reduction Barrier<br><br> Planiseal VS is an alkali-resistant, two-component, 100%-solids epoxy coating that effectively stops moisture-related problems with floor coverings. In addition, Planiseal VS expedites floor-covering installations by eliminating the traditional wait time required for new concrete slabs to reach moisture levels suitable for installations.", "Tile Setting", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Floor-Covering-Installation-Systems/Moisture-Control-Products/Planiseal-VS", 51);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Primer L", "Advanced-Technology, Acrylic Latex Primer for Concrete<br><br>Primer L is a concentrated, solvent-free acrylic primer used before the installation of underlayment materials. It is green for easy identification. Primer L improves the bond between a properly prepared and profiled concrete substrate, and self-leveling underlayment. Primer L can also be used as a primer for gypsum-based underlayments and patches.", "Tile Setting", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Primers-for-Self-Leveling/Primer-L", 52);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Primer T", "All-Purpose Primer for Self-Leveling Underlayments.<br><br>Primer T is a low-VOC, water-based acrylic primer that enhances the performance and adhesion of self-leveling underlayments (SLUs) on nonabsorbent surfaces such as ceramic tile, vinyl composition tile (VCT), epoxy moisture barriers and adhesive residue, as well as profiled, absorbent surfaces. Suitable for a wide variety of substrates, Primer Tcombines excellent versatility with an easy, low-odor application.", "Tile Setting", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Primers-for-Self-Leveling/Primer-T", 53);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapei Ultraflex 1", "Standard Tile Mortar with Polymer<br><br>Ultraflex 1 is a standard-grade, single-component, polymer-modified thin-set mortar for most interior and exterior installations of tile. This mortar has an above average content of unique dry polymer, resulting in good adhesion to the substrate and tile. Ultraflex 1 can be used for both interior and exterior installations of tile in most residential floor and wall applications. In commercial applications, use on interior floor and wall installations and exterior floors.  Ultraflex 1 meets or exceeds ANSI A118.4 and ANSI A118.11 requirements when mixed with water.", "Tile Setting", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Tile-&-Stone-Installation-Systems/Polymer-Modified-Mortars/Ultraflex-1", 54);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Quikrete Core-Fill Grout", "AQuikrete CORE-FILL GROUT is contractor-grade masonry mortar and grout designed for building and reinforcing walls made of brick, block or stone.", "Tile Setting", "Quikrete");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/productlines/corefillmasonrygrout.asp", 55);

/********/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Masterseal 581 (Formerly: Thoroseal)", "MasterSeal 581 is a portland cement-based coating for concrete and masonry that resists both positive and negative hydrostatic pressure. Polymer-modified with MasterEmaco A 660, MasterSeal 581 creates a low maintenance and highly durable waterproof barrier.", "Waterproofing", "Master Builders Solutions");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/masterseal/masterseal-581", 56);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Mapelastic Smart", "Roller-Grade, Flexible Cementitious Membrane for Concrete Waterproofing and Protection<br><br>Mapelastic Smart is a cementitious membrane for protecting new concrete structures, concrete structures repaired with Mapecem or Planitop mortars, renders with hairline cracks and any cementitious surface subject to vibrations and the subsequent cracking. Mapelastic Smart also is designed as an intermediate waterproofing membrane on such hydraulic projects as channels and faces of dams as well as swimming pools, basins, storage tanks, balconies and terraces.", "Waterproofing", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/US-EN/Concrete-Restoration-Systems/Waterproofing/Mapelastic-Smart", 57);

/*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("NOVOPLAN 2 PLUS", "Novoplan 2 Plus is a high-strength, self-leveling cement-based underlayment and repair mix for interior concrete and engineer-approved floors.", "Waterproofing", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/2028300814-novoplan-2-plus-en.pdf", 58);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/NOVOPLAN_2_PLUS_SDS_EN.PDF", 58);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-SURFACE", "PRO-SURFACE is a two-component, acrylic polymer modified cementitious product, for use as a resurfacing underlayment or as a finished floor coating. PRO-SURFACE is a liquid acrylic polymer and PRO-SURFACE POWDER is a select blend of portland cements and silica sand. Its adhesion and flexibility characteristics allow application to a wide variety of surfaces to produce a new, bondable surface compatible with essentially all types of adhesives and coatings. PRO-SURFACE is available in standard dark gray.", "Surface Preparation", "Bonded Materials");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-SURFACE 90QS", "PRO-SURFACE 90QS is a high performance, two-component, polymer-modified concrete repair mortar. Part A consists of a polymer liquid called ""PRO-SURFACE."" Part B consists of a pre-bagged mixture of quick-setting cement and specially graded sand called ""90QS."" When these two parts are mixed together they form a flexible, fast drying, high-strength repair mortar that can be subjected to vehicular traffic as soon as forty minutes after placement. Depending on the consistency of the mixture, PRO-SURFACE 90QS can be applied in thicknesses of featheredge to 10\" per lift; however, over 2\" it must be extended with 3/8"" pea gravel.", "Surface Preparation", "Bonded Materials");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("ECO PRIM GRIP", "Multipurpose Bond-Promoting Primer. ECO Prim Grip is a ready-to-use, low-VOC, synthetic resin-based primer with bond-promoting silica aggregates suspended in a dispersion. It enhances the performance and adhesion of mortars to existing ceramics and difficult-to-bond-to substrates. Plus, it improves bonding of self-leveling underlayments (SLUs) and bonds of render coats over cementitious substrates. Suitable for a wide variety of substrates, ECO Prim Grip combines excellent versatility with an easy, low-odor application.", "Surface Preparation", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/2916-eco-prim-grip-en.pdf", 61);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/ECO_PRIM_GRIP_SDS_EN.pdf", 61);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PLANISEAL VS", "Planiseal VS is an alkali-resistant, two-component, 100%-solids epoxy coating that effectively stops moisture-related problems with floor coverings. In all cases, moisture vapor emission rates (MVERs) of up to 25 lbs. per 1,000 sq. ft. (11,3 kg per 92,9 m2) per 24 hours are reduced to below the limit of 3 lbs. per 1,000 sq. ft. (1,36 kg per 92,9 m2) required for many types of finished flooring, when the designated film thickness is applied.", "Surface Preparation", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/1005818-planiseal-vs-en.pdf", 62);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/PLANISEAL_VS_PART_A&B_SDS_EN.pdf", 62);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PLANIBOND 3C", "Three-Component, Cementitious Corrosion Inhibitor and Bonding Agent. Planibond 3C is a three-component, cementitious, moisture-tolerant, epoxy-modified corrosion inhibitor and bonding agent. Water-based and solvent-free, it can be applied using a brush, a short-nap roller, a push broom or hopper spray equipment. Use Planibond 3C on all exposed reinforcing steel and as a bonding agent before the placement of repair products.", "Surface Preparation", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/1005778-primer-t-en.pdf", 63);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/PRIMER%20T_SDS_EN.pdf", 63);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRIMER T", "All-Purpose Primer for Self-Leveling Underlayments. Primer T is a low-VOC, water-based acrylic primer that enhances the performance and adhesion of self-leveling underlayments (SLUs) on nonabsorbent surfaces such as ceramic tile, vinyl composition tile (VCT), epoxy moisture barriers and adhesive residue, as well as profiled, absorbent surfaces. Suitable for a wide variety of substrates, Primer T combines excellent versatility with an easy, low-odor application.", "Surface Preparation", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/100363-planibond3c-en.pdf", 64);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/Planibond_3C_PartAB&C_EN.pdf", 64);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-POXY 100", "Pro-Poxy 100 is a 100% solids, high modulus, moisture tolerant, low viscosity epoxy adhesive for gravity feed or pressure injection of cracks in concrete. Pro-Poxy 100 meets the requirements of ASTM C-881 and AASHTO M-235.", "Surface Preparation", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/unitex-propoxy-100.pdf?sfvrsn=49a5d560_19", 65);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140048_-_pro-poxy_100_-_parts_ab_(us).pdf?sfvrsn=54a5d560_18", 65);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-POXY 200", "Pro-Poxy 200 is a 100% solids, two component, high modulus, medium viscosity, moisture tolerant structural epoxy adhesive that meets the requirements of ASTM C-881 and AASHTO M-235.", "Surface Preparation", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/unitex-propoxy-200.pdf?sfvrsn=f1a5d560_19", 66);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140099_-_pro-poxy_200_-_parts_ab_(us).pdf?sfvrsn=fca5d560_22", 66);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-POXY 204", "Pro-Poxy 204 is a 100% solids, fast setting, two component, high modulus, medium viscosity, moisture tolerant structural epoxy adhesive that meets the requirements of ASTM C-881 and AASHTO M-235. The Pro-Poxy 204 is slightly thinner than the Pro-Poxy 200.", "Surface Preparation", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/pro-poxy_204.pdf?sfvrsn=9a4d560_17", 67);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-100038_-_pro-poxy_204_-_parts_ab_(us).pdf?sfvrsn=14a4d560_20", 67);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-POXY 300", "Pro-Poxy 300 is a two component, 100% solids, moisturetolerant, high modulus epoxy gel adhesive that meets ASTM C-881 and AASHTO M-235.", "Surface Preparation", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/pro-poxy_300.pdf?sfvrsn=a1a6d560_27", 68);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140144a_-_pro-poxy_300_-_parts_ab_(us).pdf?sfvrsn=aca6d560_27", 68);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("SLOW SET BONDING AGENT", "Slow Set Bonding Agent is a 100% solids, two component, high modulus, medium viscosity, moisture tolerant, long open time structural epoxy adhesive meeting the requirements of ASTM C-881 and AASHTO M-235.", "Surface Preparation", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/unitex-slow-set-bonding-agent.pdf?sfvrsn=21a4d560_15", 69);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140430_-_slow_set_bonding_agent_-_parts_a-b_(usa).pdf?sfvrsn=2ca4d560_18", 69);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-POXY 300 FAST", "Pro-Poxy 300 FAST is two component, moisture-insensitive, 100% solids, high modulus epoxy gel adhesive that meets ASTM C-881 and AASHTO M-235 and it is listed by the ICC (formerly ICBO).", "Surface Preparation", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/pro-poxy_300_fast.pdf?sfvrsn=b9a6d560_39", 70);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140177_-_pro-poxy_300_fast_-_parts_ab_(us).pdf?sfvrsn=c4a6d560_25", 70);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("EFFLORESCENCE REMOVER", "Removes efflorescence, grout smears, cement haze, hard water stains, lime & rust deposits and hard water stains from masonry surface. Safer than Muriatic acid. Formula clings to vertical surfaces. Concentrated cleaner.", "Surface Preparation", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://glaze-n-seal.com/wp-content/uploads/2018/03/32_Efflorescence_Remover_GHS_SDS_03_08_2017.pdf", 71);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://glaze-n-seal.com/wp-content/uploads/2015/11/efflorescence-remover_12-12.pdf", 71);

/*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MASTERSEAL 600 (ACRYL 60)", "MASTERSEAL 600 is an acrylic-polymer emulsion mixed with Portland cement mortars, plasters, stucco, and concrete mixes to enhance their physical properties, adhesion to substrates, and durability.", "Admixtures", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.co.uk/en-gb/products/masterseal/masterseal-600-additive-for-cement-mixes", 72);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("ADVA 140M", "ADVA 140M is a high-range water reducing admixture that may also be used as a mid-range water reducer. ADVA 140M is based on polycarboxylate technology and does not contain chloride. ADVA 140M meets the requirements of ASTM C494, Type A and F.", "Admixtures", "GRACE");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://gcpat.com/en/solutions/products/adva-high-range-water-reducers/adva-140m", 73);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://gcpat.com/en/solutions/products/adva-high-range-water-reducers/adva-140m", 73);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("AQUAFIN-IC ADMIX", "AQUAFIN-IC ADMIX is a unique liquid waterproofing additive for concrete, consisting of a water based suspension of inorganic waterproofing agents. It can be added to concrete during the batching process or in a ready-mix truck with full mixing capabilities. Unlike powder additives, there is no risk of clumping.", "Admixtures", "AQUAFIN");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.aquafin.net/cmspdf/--23848-en.pdf", 74);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.aquafin.net/en/AQUAFIN-IC_ADMIX-590-655-product.html", 74);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("DARATARD HC", "Daratard HC admixture is a ready-to-use aqueous solution of modified salts of hydroxylated carboxylic acids. Ingredients are factory pre-mixed in exact proportions to minimize handling, eliminate mistakes and guesswork.", "Admixtures", "GRACE");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://gcpat.com/en/solutions/products/daratard-hc", 75);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("DCI-S", "DCI S Corrosion Inhibitor is a liquid added to concrete during the batching process. It chemically inhibits the corrosive action of chlorides on reinforcing steel and prestressed strands in concrete. DCI S has been formulated to provide set time characteristics similar to untreated concrete at 72 degrees (F) (22 degrees (C)).", "Admixtures", "GRACE");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://gcpat.com/sites/gcpat.com/files/2017-06/SD60061_-_DCI-S_%28USGHS%29.pdf", 76);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("EASY SPRED", "Easy-Spred is a proprietary pozzolanic formulation that is used as a plasticizer in conjunction with Portland cement, aggregate and water to produce mortar, plaster or grout or as an admixture to enhance the performance of other cementitious materials. Easy-Spred is user friendly, non-toxic and safe to the skin.", "Admixtures", "Penninsual ");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.easyspred.com/Easy-Spred%20for%20Masonry%20Cut-Sheet%20(1).pdf", 77);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("FOAM BLAST 325", "FOAM BLAST325 is a nonionic defoamer and antifoam formulation of highly refined mineral oil and proprietary additives. Tests indicate that FOAM BLAST 325 is highly compatible and stable in most standard acrylics and latexes and will not cause cratering or fisheyes. FOAM BLAST 325 is also effective as a defoamer and/or antifoam for many liquid polymers used both in the industrial and graphic arts markets.", "Admixtures", "DyStar");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.dystar.com/industrial-foam-control-mineral-oil-based/foam-blast-325/", 78);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("GRACE MICROFIBER", "Grace MicroFiber TM is a synthetic fiber for concrete, manufactured from 100% virgin polypropylene in a microfilament form. Grace MicroFiber is produced on a state-of-the-art production line which is specifically designed to yield an ultrathin concrete reinforcing fiber. Grace MicroFiber contains over 50 million individual fibers for each 1.0 lb/yd3 dosed. Engineered specifically for use in concrete, it is alkali resistant, non-absorptive and completely noncorrosive.", "Admixtures", "GRACE");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://gcpat-tools.com/construction/en-vn/Documents/Grace%20MicroFiber.pdf", 79);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MCI-2005", "MCI-2005 is a liquid concrete admixture that protects steel reinforcing, carbon steel, galvanized steel and other metals embedded in concrete from corrosion induced by carbonation, chloride and atmospheric attack. MCI-2005 protects by a time-proven migratory corrosion inhibitor function. In addition, it contains a proven contact inhibitor. When incorporated into the concrete mix, Migrating Corrosion Inhibitors (MCI) seek out and form a corrosion inhibiting protective layer on metals. When used with repair mortars and grouts, MCI-2005 will migrate to undisturbed concrete providing effective corrosion protection to rebars already in place.", "Admixtures", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/COM/products/Corrosion%20Inhibitors%20-MCI-2005-NS%20%2012.1.pdf", 80);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MCI-2005 NS", "MCI-2005 NS (normal set) is a liquid concrete admixture that protects steel reinforcing, carbon steel, galvanized steel and other metals embedded in concrete from corrosion induced by carbonation, chloride and atmospheric attack without changing the set time of most concrete mixes. MCI-2005 NS protects by a time-proven migratory corrosion inhibitor function. In addition, it contains a proven contact inhibitor. When incorporated into the concrete mix, Migrating Corrosion Inhibitors (MCI) seek out and form a corrosion inhibiting protective layer on metals. When used with repair mortars and grouts, MCI-2005 NS will migrate to undisturbed concrete providing effective corrosion protection to rebar already in place.", "Admixtures", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://cortecvci.com/Publications/PDS/MCI-2005%20NS.pdf", 81);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PLANICRETE AC", "Planicrete AC is a one-component, concentrated liquid latex admixture used to enhance the performance of cementitious repair mortars, plasters, stuccos, concrete mixes and toppings for the restoration of horizontal, vertical and overhead concrete; concrete masonry units (CMU); and masonry surfaces.", "Admixtures", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/PlanicreteAC_TDS_EA.pdf", 82);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/PLANICRETE_AC_SDS_EN.PDF", 82);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PLANICRETE UA", "Universal Latex Additive. Planicrete UA is a next-generation, water-based, one-component, concentrated liquid latex admixture used to enhance the performance of several MAPEI products, including mortar mixes. Using Planicrete UA as part of the designated design mixes will increase product performance in the areas of bond, flexural and tensile strengths in addition to increased durability and enhanced workability.", "Admixtures", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/1005812-planicrete-us-en.pdf", 83);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/PLANICRETE_UA_SDS_EN.pdf", 83);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("POLARSET", "PolarSet  is a non-corrosive, non-chloride admixture for concrete. It accelerates cement hydration resulting in shortened setting times and increased early compressive strengths. PolarSet does not contain calcium chloride and is completely non-corrosive to reinforcing steel, metal decks and all metal components of your admixture storage and dispensing system. It is formulated to comply with ASTM C494 Type C and can be used at any dosage to comply with ACI 318 guidelines for chloride content of concrete.", "Admixtures", "GRACE");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://gcpat.com/sites/gcpat.com/files/2017-07/GCP0083_PS-1-1216_POLARSET_DS_Hi-res.pdf", 84);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://gcpat.com/sites/gcpat.com/files/2017-06/SD60147_-_POLARSET_%28USGHS%29.pdf", 84);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-CRYLIC", "PRO-CRYLIC is an acrylic polymer liquid admixture designed to improve the adhesion and other physical properties of portland cement mortar, plaster and concrete. PRO-CRYLIC is a milky white liquid that is classified by the American Concrete Institute as a non-reemulsifiable bonding admixture for general-purpose bonding and to produce polymer modified mortar. Portland cement based mixes prepared with PRO-CRYLIC will exhibit improved adhesive qualities, moisture retention, flexibility, toughness and chemical resistance. Mixes prepared with PRO-CRYLIC may be used for patching, restoring and rehabilitating concrete and masonry such as concrete floors, columns and beams, sidewalks, corridors, lanais, driveways, curbs and steps, loading docks and ramps, precast concrete and pipe. Suitable for both interior and exterior use, PRO-CRYLIC may also be used as an admixture for overlayments and specialty resurfacing mortars", "Admixtures", "Bonded Materials");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("RECOVER", "Recover is a ready-to-use aqueous solution of chemical compounds specifically designed to stabilize the hydration of Portland cement concretes. The ingredients are factory pre-mixed in exact proportions under strict quality control to provide uniform results.", "Admixtures", "GRACE");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://gcpat.com/sites/gcpat.com/files/2017-07/GCP0083_RECOVER-5-1216_RECOVER_HiRes.pdf", 86);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://gcpat.com/sites/gcpat.com/files/2017-06/SD60169_-_RECOVER_%28USGHS%29.pdf", 86);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("RELAY", "RELAY is a polymer that is mixed with water, cement, and sand to form a flexible, durable, cementitious coating. It fills the need for a primerless, thin-bond, cementitious coating that can withstand critically saturated and submersed conditions.", "Admixtures", "SINAK");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://sinakcorp.com/products/repair-and-waterproofing/relay-resurfacer/", 87);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("STRUX 90/40", "STRUX 90/40 synthetic macro fiber reinforcement is a unique form of high strength, high modulus synthetic macro reinforcement that is evenly distributed throughout the concrete matrix. STRUX 90/40 adds toughness, impact and fatigue resistance to concrete. Unlike traditional microfiber reinforcement, STRUX 90/40 is specifically engineered to provide high, post-crack control performance. Reinforced concrete with STRUX 90/40 has been shown to reliably achieve average residual strength values in excess of 150 psi (1.0 MPa) at dosages that can easily be batched and finished. It consists of synthetic macro fibers 1.55 in. (40 mm) in length with an aspect ratio of 90 that have specifically been designed to replace welded wire fabric, steel fibers, light rebar and other secondary reinforcement in slab-on-ground flooring, thin-walled precast applications and composite steel floor deck. STRUX 90/40 is a user-friendly fiber reinforcement which is easier and safer to use, compared to these other types of reinforcement.", "Admixtures", "GCP");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://gcpat.com/sites/gcpat.com/files/2017-08/STRUX%2090-40%20Datasheet.pdf", 88);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://gcpat.com/sites/gcpat.com/files/2018-05/SD60175_-_STRUX%2090%2040_%28USGHS%29.pdf", 88);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("V-MAR 3", "V-MAR 3 is a high efficiency, liquid admixture designed to enable production of Self-Consolidating Concrete (SCC) by modifying the rheology of concrete. V-MAR 3 works by increasing the viscosity of the concrete while still allowing the concrete to flow without segregation. V-MAR 3 is based on a unique, patented biopolymer and is manufactured under closely controlled conditions to provide uniform, predictable performance.", "Admixtures", "GRACE");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://gcpat.com/sites/gcpat.com/files/2017-06/SD60183_-_V-MAR%203_%28USGHS%29.pdf", 89);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("WRDA HA", "WRDA HA is a modified lignosulfonate based aqueous solution of complex organic compounds. WRDA HA is a ready-to-use low viscosity liquid which is factory pre-mixed in exact proportions to minimize handling, eliminate mistakes and guesswork.", "Admixtures", "GCP");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://gcpat.com/sites/gcpat.com/files/2017-06/SD60192_-_WRDA-64%C2%AE_%28USGHS%29.pdf", 90);

/*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("CURESEAL W", "SCOFIELD Cureseal-W is a curing and sealing material developed for use on interior and exterior colored or uncolored concrete. Cureseal-W will provide minimal alteration to color. It is a medium-duty sealer with a low-gloss finish.", "Curing", "SCOFIELD");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("CURESEAL S", "SCOFIELD Cureseal-S is a curing and sealing material developed for use on interior and exterior concrete. Cureseal-S provides a gloss or matte finish and will darken the color of colored concrete surfaces. It may be used to protect horizontal or vertical quarry tile, brick, block, stone, exposed aggregate or cementitious surfaces. Best use: Stamped concrete, toppings, interiors, exposed aggregate - easier to use and generally more durable than water-based sealers.", "Curing", "SCOFIELD");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.scofield.com/tdbpdf/2015/Cureseal-S-1631-32-05.pdf", 92);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.scofield.com/tdbpdf/SDS/SDS-Cureseal-S-Sealer-080315.pdf", 92);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("KURE 1315", "Kure 1315 is a transparent waterbased blend of acrylic polymers used to cure, seal and dustproof freshly placed and finished concrete floors. it contains no oils, saponifiable resins, waxes or chlorinated rubbers. It complies with ASTM C 1315, Type I, Class A.", "Curing", "BASF");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("LITHIUM CURE 1000", "SINAK Lithium Cure 1000 is the most significant advancement in concrete curing over the past 50 years. SINAK's lithium technology outperforms all other curing products and methods. Lithium CureTM 1000 minimizes or eliminates plastic shrinkage cracking in freshly placed concrete, and produces highly durable surfaces for pavements, bridge decks and precast elements.", "Curing", "SINAK");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://sinakcorp.com/wordpress/wp-content/uploads/2017/12/Lithium_Cure_1000_PIS_171204.pdf", 94);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://sinakcorp.com/wordpress/wp-content/uploads/2018/06/LC1000-SDS.pdf", 94);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MAPECURE DR", "Water-Based, Dissipating-Resin Curing Compound. Mapecure DR is a water-based, liquid, membrane-forming curing compound for freshly placed concrete. Formulated from specially selected dissipating hydrocarbon resins, it is designed to retain water in the concrete for proper hydration, and then to begin breaking down and deteriorating when exposed to traffic, sunlight and weathering. Mapecure DR provides an excellent initial cure for concrete, allowing the concrete to achieve its ultimate strength while reducing surface shrinkage cracking.", "Curing", "MAPEI");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/2028300917-mapecure-dr-en.pdf", 95);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/MAPECURE_DR_SDS_EN.PDF", 95);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MAPECRETE HARD SI", "Sodium Silicate Densifier for Concrete. Mapecrete Hard SI is a clear, water-based sodium silicate densifier used to harden and dustproof concrete surfaces. It chemically reacts with the free lime and calcium carbonate in concrete, forming a dense, insoluble and chemically resistant surface. Mapecrete Hard SI is a VOC-free, colorless and odorless chemical solution that may be applied to horizontal interior, fresh or hardened concrete. Floors treated with Mapecrete Hard SI resist the penetration of water, oil and chemicals.", "Curing", "MAPEI");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/13-0084_Mapecrete_Hard_SI_EN_lr.pdf", 96);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/MAPECRETE_HARD_SI_SDS_EN.pdf", 96);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("S-102", "Sinak Sealer S-102 was formulated to waterproof, preserve and protect concrete by working with the chemistry of concrete. It penetrates the concrete, and combines with the soluble calcium compounds to form additional insoluble silicate structure within the concrete. The newly-formed breathing protective barrier retains all of the properties of healthy concrete except one: The extreme moisture attraction of the calcium hydroxide normal to the capillary channels in the concrete is neutralized because of its conversation to an insoluble compound.", "Curing", "SINAK");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://sinakcorp.com/wordpress/wp-content/uploads/2015/11/S-102_PIS_151101.pdf", 97);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://sinakcorp.com/wordpress/wp-content/uploads/2015/11/S-102-SDS.pdf", 97);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("SOLVENT SEAL 1315", "Solvent Seal 1315 is an acrylic copolymer cure, seal and dustproofing compound in an aromatic solvent containing 25% solids with special UV stabilizers. The higher acrylic solids content will form an excellent surface coating with a high gloss finish and will provide an outstanding cure performance. Solvent Seal 1315 is ultraviolet light stable and resists yellowing.", "Curing", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/unitex-solvent-seal-1315.pdf?sfvrsn=d4a4d560_17", 98);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/83-140785_-_solvent_seal_1315_(us).pdf?sfvrsn=dfa4d560_16", 98);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("TOP ETCH", "Top Etch is a water-based, top-surface retarder for producing exposed aggregate concrete flatwork.", "Curing", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/unitex-top-etch.pdf?sfvrsn=eca4d560_9", 99);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140885_-_top_etch-regular_(usa).pdf?sfvrsn=2a3d560_10", 99);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("TRANSGUARD 4000", "Transguard 4000 consists of a natural colored polypropylene nonwoven fabric with a 4 mil coating applied to one side. The nonperforated white coating contains ultraviolet light stabilizers providing protection against UV degradation.", "Curing", "Armorlon");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.reefindustries.com/../assets/pdf/tg4000.pdf", 100);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("UNI CURE", "BONDED UNI CURE is a non-flammable, non-toxic, non-acid chemical curing compound that hardens and densifies both fresh and aged concrete. It leaves the substrate bondable for subsequent coatings and meets USDA specifications for use in food processing areas.", "Curing", "Bonded Materials");

/*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MASTERSEAL NP1", "MASTERSEAL NP 1 is a one-component, highperformance, nonpriming, gun-grade, elastomeric polyurethane sealant. It requires no mixing and typically requires no priming to bond to many materials, including concrete and masonry.", "Joint Sealants", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/sealants-caulks/masterseal-np-1", 102);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MASTERSEAL SL 1 (sonolastic np1)", "MasterSeal SL 1 is one component, non-priming, self-leveling elastomeric polyurethane designed for expansion joints in concrete floors and decks. Use it where flexibility as well as abrasion and puncture resistance are required.", "Joint Sealants", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/sealants-caulks/masterseal-sl-1", 103);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MASTERSEAL P 173 PRIMER (primer 733)", "MasterSeal P 173 is a quick-drying solvent-based primer for priming joints and substrates before application of MasterSeal NP 1, TX 1, NP 2, CR 195, SL 1, SL 2, and NP 150 series sealants.", "Joint Sealants", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/sealants-caulks/masterseal-p-173-and-p-176", 104);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("DOW CORNING 795", "Dow Corning 795 Silicone Building Sealant is a one-part, neutral-cure, architectural-grade sealant that easily extrudes in any weather and cures quickly at room temperature.", "Joint Sealants", "Dow Corning");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://consumer.dow.com/en-us/document-viewer.html?ramdomVar=394600364019162069&docPath=/content/dam/dcc/documents/en-us/productdatasheet/61/61-885-dowsil-795-silicone-building-sealant.pdf", 105);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("Dow Corning 890-SL", "Dow Corning 890-SL Self-Leveling Silicone Joint Sealant is a one-part, self-leveling silicone material that cures to an ultra-low-modulus silicone rubber upon exposure to atmospheric moisture. The cured silicone rubber remains flexible from -20 to 300 degrees (F).", "Joint Sealants", "Dow Corning");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://consumer.dow.com/content/dam/dcc/documents/en-us/productdatasheet/62/62-017-dowsil-890-sl-si-joint-sealant.pdf", 106);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("DOW CORNING 1199 (CLEAR)", "Dow Corning 1199 Silicone Glazing Sealant is a one-part, neutral-cure RTV sealant specially formulated to meet the demanding requirements as a backbedding sealant for the high- speed manufacturing of windows and doors. Designed for aggressive adhesion to wood, vinyl, fiberglass, aluminum, and glass, Dow Corning 1199 Silicone Glazing Sealant will provide years of worry-free performance against rain, sun, and temperature extremes.", "Joint Sealants", "Dow Corning");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://consumer.dow.com/content/dam/dcc/documents/en-us/productdatasheet/62/62-586-dowsil-1199-silicone-glazing.pdf", 107);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("DOW CORNING 1200 OS PRIMER", "Dow Corning  1200 OS Primer is used to improve adhesion and accelerate adhesion build-up of silicone sealants to various substrates. This moisture curing primer is supplied as a dilute solution of reactive materials in low viscosity siloxane.", "Joint Sealants", "Dow Corning");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://consumer.dow.com/en-us/document-viewer.html?ramdomVar=2741346752676951402&docPath=/content/dam/dcc/documents/en-us/productdatasheet/11/11-15/11-1546-dowsil-1200-os-primer.pdf", 108);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("DOW CORNING PRIMER-C OS", "Primer for silicone adhesives and sealants offering a low VOC and unique fluorescing feature, allowing for a visual quality control check to ensure primer has been applied. Dow Corning Primer-C OS is used to improve adhesion and accelerate adhesion build-up of silicone sealants to various substrates. This moisture curing primer is a film forming adhesion promoter.", "Joint Sealants", "Dow Corning");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://consumer.dow.com/en-us/document-viewer.html?ramdomVar=2991727969430123452&docPath=/content/dam/dcc/documents/en-us/productdatasheet/63/63-1248-dowsil-primer-c-os.pdf", 109);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("DOW CORNING PRIMER P", "Dow Corning Construction Primer P is a one-component proprietary resin system designed to promote adhesion of silicone sealants to masonry surfaces. It imparts maximum water resistance to the bond in areas where residual water may be present, such as horizontal applications.", "Joint Sealants", "Dow Corning");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://consumer.dow.com/en-us/document-viewer.html?ramdomVar=3202151594314593143&docPath=/content/dam/dcc/documents/en-us/productdatasheet/62/62-1206-dowsil-construction-primer-p.pdf", 110);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("DENVER FOAM", "DENVER FOAM is a non-gassing backer rod used as a backing for elastomeric and other applied caulking sealants. Denver Foam controls the depth of the applied sealants and ensures cross-sectional hour-glass configuration.", "Joint Sealants", "Backer Rod");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.backerrod.com/media/98799/denverfoamtechdata-032014.pdf", 111);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("TITAN FOAM", "TITAN FOAM is a soft, grey, non-gassing, pliable backer rod, with an impervious outer skin, used as a backing for elastomeric and other cold applied sealants.", "Joint Sealants", "Backer Rod");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.backerrod.com/media/336888/TitanFoamTechData_Aug2018.pdf", 112);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("POLYFLEX 135", "Polyflex 135 is a heavy-duty polyethylene backing, single coated with a synthetic rubber adheisive.", "Joint Sealants", "Bron Tapes ");

/*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-POXY 100", "Pro-Poxy 100 is a 100% solids, high modulus, moisture tolerant, low viscosity epoxy adhesive for gravity feed or pressure injection of cracks in concrete. Pro-Poxy 100 meets the requirements of ASTM C-881 and AASHTO M-235.", "Epoxy", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/unitex-propoxy-100.pdf?sfvrsn=49a5d560_19", 113);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140048_-_pro-poxy_100_-_parts_ab_(us).pdf?sfvrsn=54a5d560_18", 114);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-POXY 200", "Pro-Poxy 200 is a 100% solids, two component, high modulus, medium viscosity, moisture tolerant structural epoxy adhesive that meets the requirements of ASTM C-881 and AASHTO M-235.", "Epoxy", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/unitex-propoxy-200.pdf?sfvrsn=f1a5d560_19", 115);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140099_-_pro-poxy_200_-_parts_ab_(us).pdf?sfvrsn=fca5d560_22", 115);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-POXY 204", "Pro-Poxy 204 is a 100% solids, fast setting, two component, high modulus, medium viscosity, moisture tolerant structural epoxy adhesive that meets the requirements of ASTM C-881 and AASHTO M-235. The Pro-Poxy 204 is slightly thinner than the Pro-Poxy 200.", "Epoxy", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/pro-poxy_204.pdf?sfvrsn=9a4d560_17", 116);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-100038_-_pro-poxy_204_-_parts_ab_(us).pdf?sfvrsn=14a4d560_20", 116);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-POXY 300", "Pro-Poxy 300 is a two component, 100% solids, moisturetolerant, high modulus epoxy gel adhesive that meets ASTM C-881 and AASHTO M-235.", "Epoxy", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/pro-poxy_300.pdf?sfvrsn=a1a6d560_27", 117);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140144a_-_pro-poxy_300_-_parts_ab_(us).pdf?sfvrsn=aca6d560_27", 117);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("SLOW SET BONDING AGENT", "Slow Set Bonding Agent is a 100% solids, two component, high modulus, medium viscosity, moisture tolerant, long open time structural epoxy adhesive meeting the requirements of ASTM C-881 and AASHTO M-235.", "Epoxy", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/unitex-slow-set-bonding-agent.pdf?sfvrsn=21a4d560_15", 118);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140430_-_slow_set_bonding_agent_-_parts_a-b_(usa).pdf?sfvrsn=2ca4d560_18", 118);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRO-POXY 300 FAST", "Pro-Poxy 300 FAST is two component, moisture-insensitive, 100% solids, high modulus epoxy gel adhesive that meets ASTM C-881 and AASHTO M-235 and it is listed by the ICC (formerly ICBO).", "Epoxy", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/pro-poxy_300_fast.pdf?sfvrsn=b9a6d560_39", 119);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/87-140177_-_pro-poxy_300_fast_-_parts_ab_(us).pdf?sfvrsn=c4a6d560_25", 119);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("TNEME-GLAZE SERIES 280", "TNEME-GLAZE SERIES 280 is a glaze-like corrosion resistant coating for walls, ceilings, floors and other surfaces; resistant to frequent pressurized hot water and detergent cleaning. Used as a topcoat/sealer for heavy duty wall and floor systems or in a stand-alone highperformance function. Excellent chemical, stain- and abrasion-resistance for a variety of substrates.", "Epoxy", "TNEMEC");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.tnemec.com/resources/product/PDS/280.pdf", 120);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.tnemec.com/resources/product/MSDS/Series%20280%20SDS_Eng.pdf", 120);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PERMA-GLAZE SERIES 435", "A versatile, thick film, 100% solids, abrasion-resistant lining specifically designed for wastewater immersion and fume environments. Provides low permeation to H2S gas, protects against MIC and provides chemical resistance to severe wastewater environments.", "Epoxy", "TNEMEC");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.tnemec.com/resources/product/PDS/435.pdf", 121);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.tnemec.com/resources/product/MSDS/Series%20435%20SDS_Eng.pdf", 121);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("POWER-TREAD SERIES 237", "A multi-purpose, broadcast, slurry broadcast or mortar applied floor topping system installed at 1/8' to 1/4' thickness. Protects against impact, abrasion and mild chemicals. We only have clear in stock.", "Epoxy", "TNEMEC");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.tnemec.com/resources/product/PDS/237.pdf", 122);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.tnemec.com/resources/product/MSDS/237%20SDS_Eng.pdf", 122);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("VAPORGAUGE", "This test kit is designed to measure the moisture vapor emission rate of concrete subfloors using anhydrous calcium chloride. In addition, a pH test kit is included to measure the concrete alkalinity at the surface. Both test kits meet and conform to American Society for Testing and Materials (ASTM) F1869-04 and F1907-04.", "Epoxy", "VAPORGAUGE");

/*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("ACRYLIC FLOOR POLISH", "Glaze 'N Seal Floor Polish is a product of revolutionary new chemistry, designed to produce a high gloss finish with extreme protection against foot traffic, abrasion and scuffing, on difficult floor surfaces.", "Sealers", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://glaze-n-seal.com/wp-content/uploads/2018/03/42_Acrylic_Floor_Polish_GHS_SDS_01_09_2018.pdf", 124);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("CURESEAL W", "SCOFIELD Cureseal-W is a curing and sealing material developed for use on interior and exterior colored or uncolored concrete. Cureseal-W will provide minimal alteration to color. It is a medium-duty sealer with a low-gloss finish.", "Sealers", "Scofield");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.scofield.com/tdbpdf/2015/Cureseal-W-1623-09.pdf", 125);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("DUR A PELL 40", "Dur A Pell 40 is a clear, filmless, penetrating water repellent for virtually all above-grade, vertical concrete, stucco, natural stone, block and brick masonry. The treatment does not alter the color or texture of the surface, nor significantly affect the vapor transmission qualities of the substrate. The solution penetrates the substrate and chemically reacts to create a powerful barrier against water penetration. This barrier is resistant to ultraviolet and weather deterioration.", "Sealers", "TNEMEC");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.tnemec.com/resources/product/PDS/664.pdf", 126);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.tnemec.com/resources/product/MSDS/664%20SDS_Eng.pdf", 126);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("ENVIROSEAL 40", "Enviroseal 40 is a clear, water-based, 40% alkylalkoxysilane penetrating sealer. It provides long-lasting protection against moisture intrusion, freeze/thaw cycles, and chloride intrusion. It is ideal for traffic-bearing surfaces.", "Sealers", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/water-repellent/surface-applied/masterprotect-h-400", 127);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("ENVIROSEAL PBT", "Enviroseal PBT is a highperformance, water-based, clear, silane/siloxane sealer designed to provide long-term protection for the most challenging split-faced and lightweight block as well as standard CMU.", "Sealers", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://worldaccount.basf.com/wa/NAFTA~en_US/Catalog/ConstCommercial/info/BASF/PRD/30605624", 128);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("GRIP 'N SEAL", "Grip 'N Seal Anti Slip Additive can be added to coating-type sealers or paint to increase slip resistance. It contains a unique micronized polymer mixes easily with seal to add slip resistance. It does not change the sealer appearance.", "Sealers", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://glaze-n-seal.com/wp-content/uploads/2015/03/gripNseal.pdf", 129);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://glaze-n-seal.com/wp-content/uploads/2016/02/43_Grip_N_Seal_GHS_SDS_01_25_2016.pdf", 129);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("KURE 1315", "Kure 1315 is a transparent waterbased blend of acrylic polymers used to cure, seal and dustproof freshly placed and finished concrete floors. it contains no oils, saponifiable resins, waxes or chlorinated rubbers. It complies with ASTM C 1315, Type I, Class A.", "Sealers", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/concrete-surface-treatment/concrete-curing-compounds/masterkure-cc-1315wb", 130);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MASTER SEAL", "Desert Brand Master Seal is a high performance clear and pigmented sealer manufactured specifically for sealing concrete and masonry patios, porches, decks, walkways and garage floors including surfaces such as exposed aggregate concrete, brick, slate, Saltillo tile and manufactured stone. Master Seal is suitable for exterior application where resistance to water, efflorescence, ultraviolet light, abrasion, staining and mildew is needed. Master Seal in clear will provide a penetrating, non yellowing satin gloss appearance while darkening the porous substrate. Master Seal is also available in six standard colors and is packaged in one and five gallon containers. Both Master Seal pigmented and clear sealers are not recommended for nonporous or dense surfaces.", "Sealers", "Desert Brand");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://desertbrand.com/wpDesert/wp-content/uploads/2017/06/MasterSealTechBullV2.pdf", 131);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://hillbrothers.com/pdf/downloads/msds/sds/db-ms-100-cp-sds.pdf", 131);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("color chart", "https://desertbrand.com/color-charts/classic-sealer-color-chart/", 131);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MULTI-PURPOSE SEALER", "MULTI-PURPOSE SEALER is a clear acrylic waterbase finish designed to protect and beautify tile, concrete and masonry surfaces. Glaze 'N Seal protects against all organic stains including cooking oil, grease and beverages. It may be used indoors or outdoors and is extremely easy to apply and maintain. Non-yellowing formula.", "Sealers", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://glaze-n-seal.com/wp-content/uploads/2015/11/multipurposesealer-1-2.pdf", 132);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://glaze-n-seal.com/wp-content/uploads/2018/03/13_Multi-Purpose_Sealer_GHS_SDS_01_09_2018.pdf", 132);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("""NATURAL LOOK"" PENETRATING SEALER", """NATURAL LOOK"" PENETRATING SEALER reacts with carbon dioxide and atmospheric moisture to form a penetrating water repellent barrier within 24 hours. The extreme low moisture absorption provided by this sealer shows little change for up to ten years.", "Sealers", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://glaze-n-seal.com/wp-content/uploads/2015/11/penetratingsealer-1-1.pdf", 133);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://glaze-n-seal.com/wp-content/uploads/2016/02/14_Natural_Look_Penetrating_Sealer_GHS_SDS_02_01_2016.pdf", 133);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("S-102", "Sinak Sealer S-102 was formulated to waterproof, preserve and protect concrete by working with the chemistry of concrete. It penetrates the concrete, and combines with the soluble calcium compounds to form additional insoluble silicate structure within the concrete. The newly-formed breathing protective barrier retains all of the properties of healthy concrete except one: The extreme moisture attraction of the calcium hydroxide normal to the capillary channels in the concrete is neutralized because of its conversation to an insoluble compound.", "Sealers", "Sinak");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.bondedmaterials.net/../assets/data/sinak_s102.pdf", 134);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://sinakcorp.com/wordpress/wp-content/uploads/2015/11/S-102-SDS.pdf", 134);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("SELECTSEAL PLUS", "SCOFIELD SelectSeal Plus waterborne concrete sealer is a tintable sealer that produces a gloss that is comparable to most solvent-based sealers. It does this with low odor, so you can use it on the interiors of most buildings. This high-solids formulation also delivers exceptional abrasion resistance in the finished floor. Use Selectseal Plus on interior or exterior colored or uncolored concrete, LITHOCHROME Tintura Stain, LITHOCHROME Chemstain Classic, LITHOCHROME Color Hardener, SCOFIELD Texturetop, SCOFIELD Revive Exterior Concrete Stain, or SCOFIELD Formula One Liquid Dye Concentrate.", "Sealers", "Scofield");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.scofield.com/tdbpdf/2015/Selectseal-Plus-1645-04.pdf", 135);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("LITHIUM CURE 1000", "SINAK Lithium Cure 1000 is the most significant advancement in concrete curing over the past 50 years. SINAK's lithium technology outperforms all other curing products and methods. Lithium CureTM 1000 minimizes or eliminates plastic shrinkage cracking in freshly placed concrete, and produces highly durable surfaces for pavements, bridge decks and precast elements.", "Sealers", "Sinak");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://sinakcorp.com/wordpress/wp-content/uploads/2017/12/Lithium_Cure_2000_PIS_171204.pdf", 136);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://sinakcorp.com/wordpress/wp-content/uploads/2016/09/LC2000-SDS.pdf", 136);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("SOLVENT SEAL 1315", "Solvent Seal 1315 is an acrylic copolymer cure, seal and dustproofing compound in an aromatic solvent containing 25% solids with special UV stabilizers. The higher acrylic solids content will form an excellent surface coating with a high gloss finish and will provide an outstanding cure performance. Solvent Seal 1315 is ultraviolet light stable and resists yellowing.", "Sealers", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.daytonsuperior.com/docs/default-source/tech-data-sheets/unitex-solvent-seal-1315.pdf?sfvrsn=d4a4d560_17", 137);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.daytonsuperior.com/docs/default-source/msds-documents/83-140785_-_solvent_seal_1315_(us).pdf?sfvrsn=dfa4d560_16", 137);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("STAIN DEFENSE SEALER", "Glaze 'N Seal Stain Defense Sealer is an exciting state of the art ""Natural Look"" penetrating sealer for water, oil and stain resistance on all granites, marble, fine stone, tile and masonry.", "Sealers", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://glaze-n-seal.com/wp-content/uploads/2015/11/stain-defense-3-11.pdf", 138);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://glaze-n-seal.com/wp-content/uploads/2016/02/95_Stain_Defense_GHS_SDS_01_25_2016.pdf", 138);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("STONE COLOR ENHANCER/SEALER", "Glaze 'N Seal Stone Color Enhancer/Sealer is a state of the art penetrating sealer for water, oil and stain resistance on flamed, honed, textured and tumbled marble, granite and limestone. It enhances color & seals in one easy step.", "Sealers", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://glaze-n-seal.com/wp-content/uploads/2015/11/stone-color-enhancer_12-121.pdf", 139);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://glaze-n-seal.com/wp-content/uploads/2016/02/96_Stone_Color_Enhancer_GHS_SDS_01_25_2016.pdf", 139);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("STONE SEALANT IMPREGNATOR", "Glaze 'N Seal Stone Sealant Impregnator is a premium state of the art penetrating oil and water repellent. It maintains a ""Natural Look"" appearance while forming a barrier that resists moisture, stains, and mildew. It is breathable (it will pass water vapor, but not allow water to pass through). It does not leave a surface coating. The 7.0 ph formula will not etch or damage any stone. Stone Sealer Impregnator does not contain any harsh chemicals and is water based, therefore, there are no unpleasant odors or health concerns.", "Sealers", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://glaze-n-seal.com/wp-content/uploads/2015/11/stonesealant_data-3.pdf", 140);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://glaze-n-seal.com/wp-content/uploads/2016/02/75_Stone_Sealant_Impregnator_GHS_SDS_01_25_2016.pdf", 140);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("""WET LOOK"" LACQUER", "Glaze 'N Seal ""WET LOOK"" LACQUER is a crystal clear, high solids acrylic coating designed to protect and beautify concrete, masonry and tile surfaces. This super-tough film was formulated for interior or exterior use. Walk on it, drive on it (it does reject organic stains). It offers ultimate protection in a clear finish.", "Sealers", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://glaze-n-seal.com/wp-content/uploads/2015/11/wet_look_con_msnry_lacq12-12.pdf", 141);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://glaze-n-seal.com/wp-content/uploads/2018/03/12_Wet_Look_Lacquer_GHS_SDS_01_09_2018.pdf", 141);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MAPECRETE HARD SI", "Mapecrete Hard SI is a clear, water-based sodium silicate densifier used to harden and dustproof concrete surfaces. It chemically reacts with the free lime and calcium carbonate in concrete, forming a dense, insoluble and chemically resistant surface. Mapecrete Hard SI is a VOC-free, colorless and odorless chemical solution that may be applied to horizontal interior, fresh or hardened concrete. Floors treated with Mapecrete Hard SI resist the penetration of water, oil and chemicals.", "Sealers", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/13-0084_Mapecrete_Hard_SI_EN_lr.pdf", 142);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/MAPECRETE_HARD_SI_SDS_EN.pdf", 142);

  /*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("FORMULA ONE LITHIUM DENSIFIER MP", "Formula One Lithium Densifier MP is a VOC-free, cost-effective treatment that will extend the nominal service life of concrete floors and reduce ongoing floor maintenace costs. It is a penetrating, semi-transparent liquid for use on architectural concrete surfaces of all types and during the grinding and polishing process to more rapidly produce a terrazzo-like floor surface with improved abrasion resistance, greater gloss retention, higher surface compressive strength and reduced dusting.", "Concrete Densifiers", "Scofield");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.scofield.com/tdbpdf/2015/FormulaOneLithiumDensifier-1830-05.pdf", 143);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("FORMULA ONE GUARD-W", "Scofield Formula One Guard-W is a VOC-compliant, cost-effective finish that contains lithium silicate; it will improve the gloss level and surface durability of ground and polished concrete when used with a high-speed burnisher. After polishing, concrete surfaces treated with SCOFIELD Formula One Guard-W will demonstrate enhanced clarity; the final color will generally be deeper than that of the original installation. It also improves resistance to water intrusion reducing maintenance costs.", "Concrete Densifiers", "Scofield");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.scofield.com/tdbpdf/2015/FormulaOneGuard-W-1880-03.pdf", 144);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MAPECRETE HARD SI", "Mapecrete Hard SI is a clear, water-based sodium silicate densifier used to harden and dustproof concrete surfaces. It chemically reacts with the free lime and calcium carbonate in concrete, forming a dense, insoluble and chemically resistant surface. Mapecrete Hard SI is a VOC-free, colorless and odorless chemical solution that may be applied to horizontal interior, fresh or hardened concrete. Floors treated with Mapecrete Hard SI resist the penetration of water, oil and chemicals.", "Concrete Densifiers", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/13-0084_Mapecrete_Hard_SI_EN_lr.pdf", 145);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/MAPECRETE_HARD_SI_SDS_EN.pdf", 145);

/*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MASON MIX", "Mason Mix is a contractor grade mortar mix designed for laying brick, concrete masonry units and stone.", "Tile & Stone Setting", "QUIKRETE");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.quikrete.com/pdfs/data_sheet-mason%20mix%201136.pdf", 146);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://www.quikrete.com/pdfs/sds-c4-masonry-mortars.pdf", 146);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("KERASET", "Keraset is a dry-set thinset mortar used for setting tile in interior/exterior residential and light commercial floor and wall applications.", "Tile & Stone Setting","Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/Keraset_TDS_EA.pdf", 147);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds (white)", "http://www.mapei.com/public/US/products/KERASET_SDS_WHITE_EN.PDF", 147);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds (grey)", "http://www.mapei.com/public/US/products/KERASET_SDS_GRAY_EN.PDF", 147);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MAPALASTIC AQUADEFENSE", "Premium Waterproofing and Crack-Isolation Membrane. Mapelastic AquaDefense is a premixed, advanced liquid-rubber, extremely quick-drying waterproofing and crack-isolation membrane for installation under ceramic tile or stone in residential, commercial and industrial environments. Mapelastic AquaDefense provides a thin, continuous barrier to protect adjacent rooms and floors below from water damage. For common problem areas like coves, corners, cracks and drains, it can be combined with MAPEI's optional Reinforcing Fabric or Mapeband accessories (cove roll and drain flash) to provide additional protection. Mapelastic AquaDefense dries after about 30 to 50 minutes and is then ready to receive any MAPEI polymer or epoxy mortar. Mapelastic AquaDefense can be flood-tested after 12 hours of drying time, is IAPMO-listed for use as a shower-pan liner, and exceeds ANSI A118.10 and ANSI A118.12 standards.", "Tile & Stone Setting", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/2103-mapelastic-aquadefense-en.pdf", 148);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/MAPELASTIC_AQUA_DEFENSE_SDS_EN.PDF", 148);

/*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("LITHOCHROME ANTIQUING RELEASE", "LITHOCHROME Antiquing Release is intended for use when imprinting freshly placed colored-concrete hard-scapes or interior floors and an antiqued appearance is desired. It promotes easy release of stamping and texturing tools and improves results by preventing transfer of wet paste when the tools are removed from imprinted surfaces.", "Release Agent", "Scofield");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.scofield.com/tdbpdf/2015/AntiquingRelease-1410-11.pdf", 149);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.scofield.com/MSDS/AntRelease_10_12.pdf", 149);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("LITHOCHROME LIQUID RELEASE", "Clear, bubblegum-scented liquid release solvent. This product is used to prevent concrete stamps from sticking to the concrete.", "Release Agent", "Scofield");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.scofield.com/tdbpdf/2015/LiquidRelease-3611-06.pdf", 150);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.scofield.com/tdbpdf/SDS/SCOFIELDLiquidRelease-BG-SDS.pdf", 150);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("FARM FRESH", "Farm Fresh XL is an economical V.O.C. compliant, concrete form release agent. Farm Fresh XL works to ensure clean, positive release on plywood, fiberglass, aluminum, steel, urethane and other concrete forming materials and form liners. This product acts as a barrier to the adhesion of concrete while minimizing surface dusting. Properly applied, Farm Fresh XL will not stain concrete or interfere with the adhesion of coatings.", "Release Agent", "Dayton Superior");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://daytonsuperior.com/docs/default-source/tech-data-sheets/unitex-farm-fresh-xl.pdf?sfvrsn=87a3d560_11", 151);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://daytonsuperior.com/docs/default-source/msds-documents/83-143495_-_farm_fresh_xl_(usa).pdf?sfvrsn=92a3d560_12", 151);

INSERT INTO PRODUCT (name, category, vendor) VALUES("FORMTECH 3", "Release Agent", "Bonded Materials");

/*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MURIATIC ACID", "Muriatic Acid is often used to clean or etch concrete.", "Cleaners", "HASA");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://hasapool.com/wp-content/uploads/Muriatic-Acid-SDS.pdf", 153);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("SEALER PAINT AND COATING STRIPPER", "Paint Sealer and Coating Stripper is a fast acting gel stripper that removes the toughest acrylic, polyurethane, epoxy or lacquer sealers from concrete, masonry, tile, stone, grout, and wood. Also, this stripper removes graffiti, paint, and oil stains. It is non-flammable, low odor, and will not harm surface.", "Cleaners", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://glaze-n-seal.com/wp-content/uploads/2015/03/Stripper.pdf", 154);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://glaze-n-seal.com/wp-content/uploads/2018/03/21_Paint_and_Coating_Stripper_GHS_SDS_01_9_2018.pdf", 154);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("OIL AND STAIN REMOVER", "A solvent based poultice that removes deep set oil & grease stains from countertops, driveways, patio decks, oors & more. USE TO REMOVE DEEP SET STAINS FROM COOKING OIL, BUTTER, GREASE, AND OILY FOODS. MARBLE,  GRANITE, LIMESTONE, TRAVERTINE, FLAGSTONE, SLATE, CONCRETE, MASONRY, PAVERS, BRICK, ALL NATURAL STONE.", "Cleaners", "Glaze 'N Seal");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://glaze-n-seal.com/wp-content/uploads/2016/04/Oil-stain-remover.pdf", 155);

/*************************************/

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("BASALT SAND", "We stock .5 cubic ft. bags of Basalt Sand. Also, 2,500 lbs. bulk bags can be special ordered.", "Aggregate", "Bonded Materials");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "../assets/data/bonded_basalt_sand.pdf", 156);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "../assets/sds/bonded_basalt_sand.pdf", 156);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("BASALT ROCK", "We stock .5 cubic ft. bags of 3/8"" and 3/4"" Basalt Rock. Also, 3,000 lbs. bulk bags can be special ordered.", "Aggregate", "Bonded Materials");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "../assets/data/bonded_basalt_rock.pdf", 157);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("CORAL SAND", "We stock .5 cubic ft. bags of Coral Sand. Also, 2,500 lbs. bulk bags can be special ordered.", "Aggregate", "Bonded Materials");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "../assets/data/bonded_coral_sand.pdf", 158);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "../assets/sds/bonded_coral_sand.pdf", 158);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("CORAL ROCK", "We stock .5 cubic ft. bags of 3/4"" Coral Rock. Also, 2,500 lbs. bulk bags can be special ordered.", "Aggregate", "Bonded Materials");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "../assets/data/bonded_coral_rock.pdf", 159);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "../assets/sds/bonded_coral_rock.pdf", 159);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("SILICA SAND", "We stock 100 lbs. bags of Silica Sand in #20, #30, #60, and #90 grit sizes.", "Aggregate", "Bonded Materials");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "../assets/data/silica_sand.pdf", 160);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "../assets/sds/silica_sand.pdf", 160);

/***** waterproofing*/
INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PROLINE SILICONE ROOF COATING", "Proline Silicone Roof Coating is a solvent free, 100% silicone roof coating. This new product contains high solids, low VOC's, and offers a one-component, moisture-curing silicone roof coating system to restore and repair your existing roof. With its high solids content and absence of hydrocarbon solvent, this coating can be applied in excess of 40 mils in a single coat without blistering, while maintaining maximum adhesion.", "Waterproofing", "Pro Line");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("100% SILICONE BRUSH GRADE CAULK", "100% SILICONE BRUSH GRADE CAULK is a thick, high-build liquid that is a dispersion of 100% silicone rubber. It is designed to seal abnormal roof penetrations that cannot be covered with standard sprayers or rollers. 100% SILICONE BRUSH GRADE CAULK sealant features low odor, ease of application, fast moisture cure, and superior adhesion to a variety of substrates.", "Waterproofing", "Pro Line");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("METAL RUST PRIMER", "Metal Rust Primer is water based primer to be used over ferrous metal surfaces and properly prepared rusted surfaces, to provide excellent resistance to flash rusting.", "Waterproofing", "Pro Line");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("CONCENTRATED ROOF CLEANER", "CONCENTRATED ROOF CLEANER is a concentrated, non-corrosive, biodegradable, water-soluble cleaner used in the preparation of roof surfaces prior to coating application.", "Waterproofing", "Pro Line");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("CBLEED BLOCK BASECOAT AND PRIMER", "BLEED BLOCK BASECOAT AND PRIMER is a one component, low VOC, water-borne base coating designed for application to roofing membranes.BLEED BLOCK BASECOAT AND PRIMER is the industry standard, high performance base coat for hard to coat surfaces such as Hypalon, PVC, TPO, and EPDM roofing.BLEED BLOCK BASECOAT AND PRIMER eliminates the need for costly replacement and pre-treating EPDM with a caustic solution.", "Waterproofing", "Pro Line");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("BUTYL SEAM TAPE", "BUTYL SEAM TAPE is a 4-inch wide, high tensile strength, polyesterreinforced, butyl rubber sealant tape for sealing edges and seams on metal roof panels.", "Waterproofing", "Pro Line");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("ALLGUARD (SPECIAL ORDER ONLY)", "Dow Corning AllGuard Silicone Elastomeric Coating is designed to waterproof above-grade exterior masonry substrates, such as concrete block, fluted block, brick, stucco, synthetic stucco, poured concrete, precast concrete, exterior insulation finish systems (EIFS), and previously coated masonry substrates.", "Waterproofing", "Dow Corning");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://consumer.dow.com/content/dam/dcc/documents/en-us/productdatasheet/62/62-048-dowsil-allguard-silicone-elastomer-coating.pdf", 167);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://consumer.dow.com/en-us/pdp.dowsil%E2%84%A2%20allguard%20silicone%20elastomeric%20coating%20deep%20tint%20base.04114040z.html?tab=sds&id=04114040z", 167);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("ALLGUARD PRIMER", "Water-based silicone adhesion promoter for use with Dow Corning AllGuard Silicone Elastomeric Coating.", "Waterproofing", "Dow Corning");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://consumer.dow.com/content/dam/dcc/documents/en-us/productdatasheet/62/62-1182-dowsil-allguard-primer.pdf", 168);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://consumer.dow.com/en-us/pdp.dowsil%E2%84%A2%20allguard%20primer.03141021h.html?tab=sds&id=03141021h", 168);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("AQUAFIN-IC ADMIX", "AQUAFIN-IC ADMIX is a unique liquid waterproofing additive for concrete, consisting of a water based suspension of inorganic waterproofing agents. It can be added to concrete during the batching process or in a ready-mix truck with full mixing capabilities. Unlike powder additives, there is no risk of clumping.", "Waterproofing", "Aquafin");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.aquafin.net/cmspdf/--23848-en.pdf", 169);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.aquafin.net/en/AQUAFIN-IC_ADMIX-590-655-product.html", 169);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MAPALASTIC AQUADEFENSE", "Premium Waterproofing and Crack-Isolation Membrane. Mapelastic AquaDefense is a premixed, advanced liquid-rubber, extremely quick-drying waterproofing and crack-isolation membrane for installation under ceramic tile or stone in residential, commercial and industrial environments. Mapelastic AquaDefense provides a thin, continuous barrier to protect adjacent rooms and floors below from water damage. For common problem areas like coves, corners, cracks and drains, it can be combined with MAPEI's optional Reinforcing Fabric or Mapeband accessories (cove roll and drain flash) to provide additional protection. Mapelastic AquaDefense dries after about 30 to 50 minutes and is then ready to receive any MAPEI polymer or epoxy mortar. Mapelastic AquaDefense can be flood-tested after 12 hours of drying time, is IAPMO-listed for use as a shower-pan liner, and exceeds ANSI A118.10 and ANSI A118.12 standards.", "Waterproofing", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/2103-mapelastic-aquadefense-en.pdf", 170);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/MAPELASTIC_AQUA_DEFENSE_SDS_EN.PDF", 170);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MAPELASTIC SMART", "Roller-Grade, Flexible Cementitious Membrane for Concrete Waterproofing and Protection.Mapelastic Smart is a cementitious membrane for protecting new concrete structures, concrete structures repaired with Mapecem or Planitop mortars, renders with hairline cracks and any cementitious surface subject to vibrations and the subsequent cracking. Mapelastic Smart also is designed as an intermediate waterproofing membrane on such hydraulic projects as channels and faces of dams as well as swimming pools, basins, storage tanks, balconies and terraces.", "Waterproofing", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://cdnmedia.mapei.com/docs/librariesprovider14/products-documents/2013-mapelasticsmart-aus21deb77479c562e49128ff01007028e9.pdf?sfvrsn=e97e5d71_0", 171);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds (a & b)", "https://www.mapei.com/au/en/products-and-solutions/products/detail/mapelastic-smart", 171);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("FIBERGLASS MESH", "MAPEI's Fiberglass Mesh is a ready-to-use, thin, strong yet flexible alkali-resistant mesh for embedment with waterproofing and crack-isolation membranes, including MAPEI's Mapelastic, Mapelastic 315, Mapelastic HPG and Mapelastic Smart on residential and commercial floors, walls and ceilings.", "Waterproofing", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "../assets/data/mapei_fiberglass_mesh.pdf", 172);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PLANISEAL VS", "Planiseal VS is an alkali-resistant, two-component, 100%-solids epoxy coating that effectively stops moisture-related problems with floor coverings. In all cases, moisture vapor emission rates (MVERs) of up to 25 lbs. per 1,000 sq. ft. (11,3 kg per 92,9 m2) per 24 hours are reduced to below the limit of 3 lbs. per 1,000 sq. ft. (1,36 kg per 92,9 m2) required for many types of finished flooring, when the designated film thickness is applied.", "Waterproofing", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/1005818-planiseal-vs-en.pdf", 173);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/PLANISEAL_VS_PART_A&B_SDS_EN.pdf", 173);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PRIMER T", "All-Purpose Primer for Self-Leveling Underlayments. Primer T is a low-VOC, water-based acrylic primer that enhances the performance and adhesion of self-leveling underlayments (SLUs) on nonabsorbent surfaces such as ceramic tile, vinyl composition tile (VCT), epoxy moisture barriers and adhesive residue, as well as profiled, absorbent surfaces. Suitable for a wide variety of substrates, Primer T combines excellent versatility with an easy, low-odor application.", "Waterproofing", "Mapei");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.mapei.com/public/US/products/1005778-primer-t-en.pdf", 174);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.mapei.com/public/US/products/PRIMER%20T_SDS_EN.pdf", 174);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("PROTECTION COURSE", "Sonneborn Protection Course is a high-quality multilayer fiber board bonded and laminated with a water-resistant adhesive. It is used as a protection course to guard membrane waterproofing and dampproofing against costly damage during construction.", "Waterproofing", "Sonneborn");

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MasterSeal Traffic 1500 (SONOGUARD)", "Polyurethane waterproofing, traffic-bearing membrane systems for vehicular and pedestrian areas. MasterSeal	Traffic	1500	waterproofing systems	are	composed	of:	MasterSeal	M	200 (a	one-component, moisture-curing	polyurethane),	MasterSeal	TC	225 (a	one-component aliphatic	moisture-curing	polyurethane), MasterSeal	TC	225	Tint	Base (consisting	of	40	standard	colors,	see	Form	no.	1017936). For	projects requiring	primer,	two	choices	are	available: MasterSeal	P	222 (a	one-component	solvent-based	primer	and	sealer),	MasterSeal	P	220 (a	two-component	waterborne	epoxy	primer	and	sealer).", "Waterproofing", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/deck-coatings/masterseal-traffic-1500", 176);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MasterSeal 915 (ADHESION PROMOTER)", "MasterSeal 915 is an adhesion promoter to use over MasterSeal Traffic 1500 (SONOGUARD). Basically, this product softens the surface of the existing urethane so that a new coat of MasterSeal 915 will adhere.", "Waterproofing", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.co.uk/en-gb/products/masterseal/masterseal-600-additive-for-cement-mixes", 177);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("SONOSHIELD HLM 5000", "MASTERSEAL HLM 5000 is a one-component, moisture-curing, bitumen-modified polyurethane elastomeric waterproofing membrane for exterior below-grade or between-slab applications. It is available in 4 grades for application by trowel, squeegee, roller and spray.", "Waterproofing", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/waterproofing/split-slab-and-below-grade-waterproofing/masterseal-hlm-5000", 178);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("MASTERSEAL 581 (THOROSEAL)", "MASTERSEAL 581  is a Portland-cementbased coating for concrete and masonry that resists both positive and negative hydrostatic pressure. Polymer-modified with Acryl 60, Thoroseal creates a low-maintenance and highly durable waterproof barrier.", "Waterproofing", "BASF");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.master-builders-solutions.basf.us/en-us/products/waterproofing/cementitious-coatings/masterseal-581", 179);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://www.master-builders-solutions.basf.us/en-us/products/waterproofing/cementitious-coatings/masterseal-581", 179);

/*********************/
INSERT INTO PRODUCT (name, description, category, vendor) VALUES("LITHOCHROME CHEMSTAIN CLASSIC", "Formulated to add color to uncolored concrete or to change the color of colored concrete, LITHOCHROME Chemstain Classic chemically reacts with the surface of cured concrete to produce unique and permanent color effects. It contains no Volatile Organic Compounds (VOC) and meets stringent air quality management regulations.", "Coloring & Stain", "Scofield");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.scofield.com/tdbpdf/2015/Chemstain-1320-19.pdf", 180);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("color chart", "http://www.scofield.com/tdbpdf/brochures/LITHOCHROME-Chemstain-A412.pdf", 180);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds (black)", "http://www.scofield.com/tdbpdf/SDS/SDS-Chemstain-1_2-011118.pdf", 180);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("DAVIS COLORS", "Davis Colors are made with pure, concentrated pigments specially processed for mixing into concrete or any other building material made of cement. They are lightfast, alkali resistant, weather resistant and formulated to give longlasting appeal to concrete. Davis Colors have been giving concrete the added design dimension of color since 1952. Davis Colors meet or exceed ASTM C979, which establishes the criteria for the alkali resistance, stability and lightfastness of pigments and their compatibility with concrete.**We only stock base colors: #116,#5084,#5447, #160, #641, #677,and #860.**", "Coloring & Stain", "Davis Colors");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.daviscolors.com/tech-and-safety-data-sheets/", 181);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://www.daviscolors.com/tech-and-safety-data-sheets/", 181);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("LIQUIBLACK", "LIQUIBLACK is the modern concrete colorant that has replaced old-fashioned lampblack for adding a complete range of shades from grey to black in concrete, plaster, and mortar. There's no mess when you use LIQUIBLACK, no fine, smudging powder that seems to get all over everything. All you do is add a specified amount of LIQUIDBLACK to your mix. Immediate, uniform dispersion assures an even color that won't show white even if chipped.", "Coloring & Stain", "Concrete Chemicals");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.liquiblack.com/", 182);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("LIQUIBLUE", "LIQUIBLUE is a liquid blue dye that mixes with concrete to turn concrete different shades of blue.", "Coloring & Stain", "Concrete Chemicals");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.liquiblack.com/", 183);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("LITHOCHROME TINTURA STAIN", "LITHOCHROME Tintura Stain is a high performance, self-priming, low-order, reactive polymer stain for use on interior or exterior, vertical or horizontal concrete and other cementitious surfaces. It is designed for use as a primer/basecoat beneath clear solvent or waterborne acrylic, urethane, or epoxy stealers. It is an excellent choice for areas that must be quickly returned to service. It can be applied lightly to gently tone surfaces, spot sprayed, sponged, or layered to develop variegated artisan effects. It can be applied at lower coverage rates to develop rich opaque colors.", "Coloring & Stain", "Scofield");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.scofield.com/tdbpdf/2015/Tintura-7340-09.pdf", 184);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("color chart", "http://www.scofield.com/tdbpdf/brochures/LITHOCHROME-Tintura-A422.pdf", 184);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "http://www.scofield.com/tdbpdf/SDS/LITHOCHROME-Tintura-PartA-SDS.pdf", 184);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("SELECTSEAL PLUS", "SCOFIELD SelectSeal Plus waterborne concrete sealer is a tintable sealer that produces a gloss that is comparable to most solvent-based sealers. It does this with low odor, so you can use it on the interiors of most buildings. This high-solids formulation also delivers exceptional abrasion resistance in the finished floor. Use Selectseal Plus on interior or exterior colored or uncolored concrete, LITHOCHROME Tintura Stain, LITHOCHROME Chemstain Classic, LITHOCHROME Color Hardener, SCOFIELD Texturetop, SCOFIELD Revive Exterior Concrete Stain, or SCOFIELD Formula One Liquid Dye Concentrate.", "Coloring & Stain", "Scofield");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "http://www.scofield.com/tdbpdf/2015/Selectseal-Plus-1645-04.pdf", 185);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("STONE ESSENCE", "STONE ESSENCE is a unique ecofriendly alternative to acid stained concrete. STONE ESSENCE is a concentrated water-based coloring system composed of UV stable, transparent iron oxide pigments. STONE ESSENCE is not a sealer, but surfaces colored with STONE ESSENCE can be sealed with either solvent or waterborne sealers.", "Coloring & Stain", "Euclid Chemical");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://www.euclidchemical.com/fileshare/ProductFiles/TDS/Decorative/Stone_Essence.pdf", 186);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://www.euclidchemical.com/fileshare/ProductFiles/MSDS/CSES_O032_830_U.pdf", 186);

INSERT INTO PRODUCT (name, description, category, vendor) VALUES("ALLGUARD (SPECIAL ORDER ONLY)", "Dow Corning AllGuard Silicone Elastomeric Coating is designed to waterproof above-grade exterior masonry substrates, such as concrete block, fluted block, brick, stucco, synthetic stucco, poured concrete, precast concrete, exterior insulation finish systems (EIFS), and previously coated masonry substrates.", "Coloring & Stain", "Dow Corning");

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("data", "https://consumer.dow.com/content/dam/dcc/documents/en-us/productdatasheet/62/62-048-dowsil-allguard-silicone-elastomer-coating.pdf", 187);

INSERT INTO PRODUCT_IMAGE (name, image_path, product_id) VALUES("sds", "https://consumer.dow.com/en-us/pdp.dowsil%E2%84%A2%20allguard%20silicone%20elastomeric%20coating%20deep%20tint%20base.04114040z.html?tab=sds&id=04114040z", 187);
