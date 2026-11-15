// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 310;
  localparam OW = 332;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005261 dut (
    .trs(in_vec[309:306]),
    .is_interlaced(in_vec[305:305]),
    .is_serial_output(in_vec[304:304]),
    .is_sample_count_f0(in_vec[303:288]),
    .is_line_count_f0(in_vec[287:272]),
    .is_sample_count_f1(in_vec[271:256]),
    .is_line_count_f1(in_vec[255:240]),
    .is_h_front_porch(in_vec[239:224]),
    .is_h_sync_length(in_vec[223:208]),
    .is_h_blank(in_vec[207:192]),
    .is_v_front_porch(in_vec[191:176]),
    .is_v_sync_length(in_vec[175:160]),
    .is_v_blank(in_vec[159:144]),
    .is_v1_front_porch(in_vec[143:128]),
    .is_v1_sync_length(in_vec[127:112]),
    .is_v1_blank(in_vec[111:96]),
    .is_ap_line(in_vec[95:80]),
    .is_v1_rising_edge(in_vec[79:64]),
    .is_f_rising_edge(in_vec[63:48]),
    .is_f_falling_edge(in_vec[47:32]),
    .is_anc_line(in_vec[31:16]),
    .is_v1_anc_line(in_vec[15:0]),
    .interlaced_nxt(out_vec[331:331]),
    .serial_output_nxt(out_vec[330:330]),
    .h_total_minus_one_nxt(out_vec[329:314]),
    .v_total_minus_one_nxt(out_vec[313:298]),
    .ap_line_nxt(out_vec[297:282]),
    .ap_line_end_nxt(out_vec[281:266]),
    .h_blank_nxt(out_vec[265:250]),
    .sav_nxt(out_vec[249:234]),
    .h_sync_start_nxt(out_vec[233:218]),
    .h_sync_end_nxt(out_vec[217:202]),
    .f2_v_start_nxt(out_vec[201:186]),
    .f1_v_start_nxt(out_vec[185:170]),
    .f1_v_end_nxt(out_vec[169:154]),
    .f2_v_sync_start_nxt(out_vec[153:138]),
    .f2_v_sync_end_nxt(out_vec[137:122]),
    .f1_v_sync_start_nxt(out_vec[121:106]),
    .f1_v_sync_end_nxt(out_vec[105:90]),
    .f_rising_edge_nxt(out_vec[89:74]),
    .f_falling_edge_nxt(out_vec[73:58]),
    .total_line_count_f0_nxt(out_vec[57:45]),
    .total_line_count_f1_nxt(out_vec[44:32]),
    .f2_anc_v_start_nxt(out_vec[31:16]),
    .f1_anc_v_start_nxt(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 310'h199d01ed0017585fe6c52c1ac731e49a88098e685c44a83df23fda20aa3fc68d2feed651eb7c65;
    stim[1] = 310'h379e7f46441359bfa0877fd6132ea57088ba1c7f7b9073f59488f1ba9496fb488932e032921115;
    stim[2] = 310'h2bdbda8319e9a3404c166ca7b4d3ef1519e374820ff94230ff18587b7cb95df6055712e662d2fa;
    stim[3] = 310'h14f96807b782804f99a7469f22e957b9b907386bd4aa8e7d1510e99f1bab2545dfee7a403ff3c8;
    stim[4] = 310'h0549027159da52067690eeb167f767fb165210254101365d7ee04872124a5daefe5f2fb7a663aa;
    stim[5] = 310'h1a78a94167b7d5d4407b6d8d96094f932b39c2cfb104b44f5621b493e4c33c5429746808cadf14;
    stim[6] = 310'h2c6785f7758c5d4f5320f307442baaf4375d65a2b36740fb2b3ff942d5e2aa470ea8f28fd09a82;
    stim[7] = 310'h3ddef6b7102421efd9d8a5c5c69a7600ebb6751ef96e3d0e70f4a1c1b2fa35cccb930e3703b56a;
    stim[8] = 310'h26fc813fbca2b3741e8e041d3910b608f1930b07a24642f56bad4feb2cfbec4a2deba1e14446ed;
    stim[9] = 310'h14433d67efee3cb98455c928d21ff8550963c1c13be5844e938011ac94d87e7323413693d5eb76;
    stim[10] = 310'h39b086a24939523546162ab2566bfe97f8ba4119190baf3efa0bf1bfd90f532ecce11ac80fa726;
    stim[11] = 310'h130a53d876f28012b66e07c4f3576b581571bbba55b3e3d1d9f702113aad952496ec7c7f8be7f1;
    stim[12] = 310'h029215b5a88cfcdb1cf3ba24cd3d4e472e6e334339557997123569c08b0fd5df65ccfbcc7749f8;
    stim[13] = 310'h3e2dfc99baaaeaeb49fcd4f8129b1fbd30b980050e0f257a6339c9e172163c080acb69af1b6bb9;
    stim[14] = 310'h1e19fa2aefa2ed9ee558bf8eda1ef13da2c9a282ac4ae44d902db015850850ff452ec2228f565b;
    stim[15] = 310'h3b6024bc114bfce5615d62022812fb11d5dd335e572260dcc35cbdc20f2f363adfb44b75f03d2f;
    stim[16] = 310'h2829a5e4241e4f47b19cdfb9264c8d12333a71d1ddffb270d6cefa9fe0bdb009ad5418ae70476d;
    stim[17] = 310'h07b5609e5916022b4864113537e3ce09719a03647b2afe143ef06b02031a59a56554e0a585045f;
    stim[18] = 310'h143090fb5d85b77ad80209c0c5e76833b7078f8198c68d590b7e56bea0f93191bff78b4792a610;
    stim[19] = 310'h380e4d4e11702dc65ce683f5a1ff53a9f838cc2a44b3d683a21e0fafd60eade61421f855422b2d;
    stim[20] = 310'h2e0f45c3e3b4907d87f3b19d1096fa00224e2551580362816d70e796acd3cda5d15bec323865ca;
    stim[21] = 310'h049a0584538add3c7bfbbf60b4203b92e8cc22b0574299e43ad51c2ac6cfcded736c47d6dcc790;
    stim[22] = 310'h23193e4c90c965eba7a96ca8599136cb789a9ff5af218386f060fe4d930b592295778552b62a87;
    stim[23] = 310'h303b07364b5ea495e0aa7fdf89a38f7e4d28df43a31c2bf3c2ac4c8064e14549478683c14e0d5a;
    stim[24] = 310'h24ae3791814e7b90bfd74edd21a48bc2d7f3b899ad3683eaf0f817b3fb336e2e4ffcd5ba0314b3;
    stim[25] = 310'h3bb71b389ee5a44ce94b592f80cdf4e723b21c8fd62db61351096eeafd019067a83243ecdaeead;
    stim[26] = 310'h1ff240d416673afce49b7a87acc2372881bc594e482632608cd7d78c0e7deef3e02aa476288ba2;
    stim[27] = 310'h24c9f1417a69cc204d8adaf6a4fc9d3475d28139dd912680df9d29ebd24e3b1b43a7ad5db293ff;
    stim[28] = 310'h1935c610f7f2d47b3116d82f03fbd293953b85caa8ca7ab3ba7435cead1a2e6cd842c600339a3d;
    stim[29] = 310'h1664e61e359ba3b61feffa52dcf283e7a0869059fe03f87ae838c717e08fbc79f83ed3842629a2;
    stim[30] = 310'h1ab2af7b7c12671f122b1a4b0703adb1953bc136680d8ceca75f4e313dfd2e238f0de9b978ea6b;
    stim[31] = 310'h35f027f1b5f4df8183c17f3a75ad79939c72051abfa5be4c85ee66d0ed5bf3022ee64449073805;
    stim[32] = 310'h277e25a96b1d6c59e32d6aa420b54de98e1019747e84ac540d7af111a5a683aa2202bdf8060b45;
    stim[33] = 310'h3124c35c533ee303a615b8444234f968c08ba5a14d3a3d32f5882fc90520137d62b9f72cda0d37;
    stim[34] = 310'h193e5762588d9202fb5ea379e3a1225e3ed686a7d86df6bf4f89d65cb33f48bc71af1c79b9db68;
    stim[35] = 310'h0034456c432d2984fcc52ae366ba0ad27bc59094eca187a6b4f51dce0978375b97e19637f1dc0a;
    stim[36] = 310'h2d755577fd77c83b229f6c04c416fe317bbce9df17742874d34fe8da9b7dfe28c69b5a334e6163;
    stim[37] = 310'h2e3869b7e5d52b227175387eb38120d6d413e87399a56461ebbf86cc77f4c51ae07d931a04edc8;
    stim[38] = 310'h27d1002f1909eb30cb75c9654dd079d680eb280507b1e5f5866bafb65d3b543b980bb0e66b4349;
    stim[39] = 310'h38c87d4599d12f3b680e00f1b4f77c61f2e9b7b1269c591b55490f77be3ba43d7711f0a7b63693;
    stim[40] = 310'h171f1c8a78ad430dff75a79560bc4253c82b9536dda885f2192e2011adc1b72ae694f88a24c75a;
    stim[41] = 310'h35e8fef0bafd66b038bbad9daedbbdfa98c6b2957d31f0e4dfcfe9655d937f88c6660213fe780c;
    stim[42] = 310'h12015a22e18e3abb1330dbb087ea5c029a4762772d15f6665fd9b55d039c70826098e6df7c2742;
    stim[43] = 310'h148c97041e0442c02dc7e85ba31fda0ae0fceeb09af35287d787c203cb4c9f30bac64f69120ef3;
    stim[44] = 310'h078d473df3ca6d8d48169d0baf3effdd9d1ea2d5979db6b5adf6806ba94d1975508ad1175834f5;
    stim[45] = 310'h24a653926d91aee9e58fdad19afff729f22403c4fa0646bd87dcfdb72b71c552b60aff34892122;
    stim[46] = 310'h034350f1f3ff9cde90eb2c605e5a3112c0402aa316b5a0cb35b204fd6201695e4981dfb211aab6;
    stim[47] = 310'h0771759250f810fd05898a733b0eb44cc5daa14eacdbad6056c22b69a2c3b1d619e20a1cd685f4;
    stim[48] = 310'h26456402ebb8d13652f0e5783a44a441b052b652c2cf79a40ffcc0b9bea84c476aa8e1bcdf861b;
    stim[49] = 310'h35bc67ff9fed746f01c70556830f5e691a8e88a6e1cd53868b85a84b067d304f16a73f3fca546d;
    stim[50] = 310'h2da2c9c44388fb6c0d3ca484733a965ba1dac66ef9d5727bf046b1ad95f1a25b6ea3a506f0ab1d;
    stim[51] = 310'h083b6b996939c4fa9a3a81365ba588b5f6aec8b99f485de62ea3962ce2ae3114a310b5f56f36ec;
    stim[52] = 310'h359dbffd7d604b691e5a436e81a122f37325a37d3579fdcb2be39322554932c4b329ac976a6f2e;
    stim[53] = 310'h06a479d4d9f35430b7cb4d3c87de1fe2acc9f4eb6e7ea70eb5c21e1e29a3e3f1d57b548be79a54;
    stim[54] = 310'h24748b7da379c217d003903249c1c6324ed8bdbf590b2877beee0acc7460f6158052d51fabbb59;
    stim[55] = 310'h1aa13969fbc20059e192b0df3e7f972143ca47d055ff9bfb0617f7f4ab85ac9bc0e0c7cee4948a;
    stim[56] = 310'h110f4cdb432a3c1407a6901bb28af9b0980088d3d4a47dede50df00aa897d1e604c24e3a4359ec;
    stim[57] = 310'h04a2f6eb205db1fa357cfe6b2589af04da3f6c2cf1713a3f6f4a93871ee5b3c287fa33ac9b1f83;
    stim[58] = 310'h1969eff0841d747a8ec2b009c8178bcb8ab4b53dff7a416a05ceb8219978762646310f85030e52;
    stim[59] = 310'h3f997ccc7249a40d2b7256a5c73928ab8fda3e6415ceb627cf114901167d4325f32b1d72da79f3;
    stim[60] = 310'h29787499a862771151721f44f4f7cde895fedce821a992a600d30dceb80d5de3f34d06540dd063;
    stim[61] = 310'h0dc64a1916f9820928902932d4d61d4746739d06273af67096ef2148474698b9cec2ca50fc0eff;
    stim[62] = 310'h3b47815d2d6824d0d7d4cc7d015843407312d945d6cf2b1d25e41447f2ded724f082648ab9a831;
    stim[63] = 310'h1898fb0d46c604adbe8b80ac48dfece0025fd9d60d84aaad402b293c975120a8f61f46afe9442c;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 332'h73b91556c82a8d2c8c790c77b14b37fcfb4007c717bda1e2244598f1286d9b2148e23ef759f869d5bbb;
      expv[1] = 332'hf348c393eea514ef0ba94ba621dfd764a3b57719d9563fd76e5e5b36989ba37d61a70b528a5864e5681;
      expv[2] = 332'hebf21772dedf389434fbf4f9459b2f8836ef4f78558e7c35b5128dc8da089ea24e5892a147ac8b2577e;
      expv[3] = 332'h38af9ce2a7c6f51c3a55fa54a9d1919a01edc302873cf05c322a2da60ceb69b130ba88befac14af54ad;
      expv[4] = 332'h501a25a65c8489223dd9fdd9a43b90955c567612ee24db1bef9ff6604dbfcf3b20edf97209ddc2ef198;
      expv[5] = 332'ha07dc1c2e4f91cca0253c2525edb4240cdd6cbd6144332a181120d0320d8b01179e4054046a7bf24b30;
      expv[6] = 332'h24cba689d0b555d4caea8ae7c83cca0dfddd67f577f3baeb124441c54090010e40115a61c42e72357ad;
      expv[7] = 332'h5e5af582306c8515e69da699f629679aedc40e20cb492dfedb9c29b02d4c02c669d946b57274b5af3b8;
      expv[8] = 332'h834d9a32bacb1f67c42d842b63812acf584a44302f83da86bf4955c0931b57c05a50095c41b5ee35bc1;
      expv[9] = 332'h18cd0a4a6b251f2587fe07fcd5725fa6d9fbcafaaafeef3e082e445b980071a3ef733348919106b3ee2;
      expv[10] = 332'h4720eed86ff67ee25aff9afc058ab220289253de96dace907d2096ca6688dbbcf728de30d7fc398e74d;
      expv[11] = 332'hd86f6720844ea2d255dad5d9db81ccbeb88ba716e4d74e90eaff940f8885c4d71df15d30de90ad4d6b7;
      expv[12] = 332'hb3d882597022d236cf538f53bcee8621f18b53d2a12cc356dee3a930cef547b685758e562391552896d;
      expv[13] = 332'hb246b0f6785cb89a26c7e6c43f353d39afb30d329ba4deff0d5f10fbef9489a62b74617931c91838a47;
      expv[14] = 332'h8e3a9e8bc561592ac7bc47ba962ff9e67de13cb2c81ecd49bfb20f6be2cffa7024db75b9f52873a40d6;
      expv[15] = 332'hdcc797217083e69dc4bec4bb575897e2bf8bdb49f27904013b4de3e1db129e3413b095e519210677b20;
      expv[16] = 332'h1d8c6d8027f8058853235320e737d581790907743b32bd95cc320760a3961a735a8e46fe92bc491a78d;
      expv[17] = 332'he64b47a18080c72138f3b8f3590466522e830615823070df576010d515e4a8d89c5908c1a25c209025c;
      expv[18] = 332'h05fddf3d2fa82f9579da39d8c08270b3bed74ea46e39cbc50da8c047968a74c7ed781f9465705e7e770;
      expv[19] = 332'h0367de152bf5b21fffd4ffd179a0f709138457b5df39be024c3544ab6593cd8fba9dc465a8c1dc17b57;
      expv[20] = 332'ha98f80ea25ab1b3f65bea5bbfcec64306c944f486b822c9cc0261020f07c03c9723a70f4b2d9f35cf1e;
      expv[21] = 332'h2e8fcd2a4ab18279080ec80ebeefd71ce114e941de88c5cef8d779e832f6b0ab5d8ac8b41e5e0c09cca;
      expv[22] = 332'hea9ce3b8d364d054644da44baa5b1471664d6f7187b1192b7fd337d2598e7540ae35b0936999407dcf4;
      expv[23] = 332'h37a55e7b60193e62a8e3e8e0ea9fe2820d92d838434b6d26375ddf431c33b238e0036f9644dbad88cf6;
      expv[24] = 332'h14b04acb6cfeddcce922e920b5d3ad1be4605fdcdde2951612042d7da8399e951d023db3529313660b8;
      expv[25] = 332'he14387b2babf4cf3b37d337992d65eb663bd45a4c8005d860a0d111255e69f2ad9845e0cfc320a803b0;
      expv[26] = 332'hed1dbdc623039ac2f08df08c26de88c9aa347c78326df454a36ac6049e2799f4a56bc01d709e133ff94;
      expv[27] = 332'h31a35ed5baf4a3e17f277f2522b6a05f905e989a7fe49d7bd21c3ce3dd1b8bdc4dccb00e0c4ed37a82d;
      expv[28] = 332'h4c65f6e7b3ab433cbef4bef305b61176c43dd2e06feda9233804457ef26d678ad3ee25078800d25cb90;
      expv[29] = 332'h95da19c605f813ce7ca0fc9fbbfe90b58346ddf72c28fd2eded2def53daf18862383291528dd35f11c2;
      expv[30] = 332'had96cc10cc4f7fc1c0eb40e9cac69d887e7732fc4acfeadc79ccb65f71893c94833c1bb4268b87fb92e;
      expv[31] = 332'h6767c31cf43b4ee1eb5e6b5b305ffefd3c6d62c19e5b21547dd58c311f524c504872fd2bdc6848e6718;
      expv[32] = 332'hccdc7caf046978462d536d510b5ab4629f8fe53783f3d9f35df986629b65e61f78f5720d9b5d91ef9a0;
      expv[33] = 332'h566eff67f2414d26cd3e4d3b456e167e9714d5c3b7cf7144d42e2452f1102d177ba49e39a5761754432;
      expv[34] = 332'h77de028bd72ceb5f6848a84717a8f621989638a55b1af025a5c71422c3f697ef972673cfd1827367eb5;
      expv[35] = 332'h3b93804bb3824cc9ae82ae82b14aaa241b10ea8ba7d2cfaf811392ed7c9a6363852f2074b0c6b170e01;
      expv[36] = 332'h631495c4f6a6df1e45bf85bce7db290c1dff68d8fcd2ea5e199845e2e317938ac5f4f38085cafc786c8;
      expv[37] = 332'hae62035d331dd03fa04820455d4e3cfae6770a13b9f51c2c2126336c8be7539a6fa4741b3665b022151;
      expv[38] = 332'he85e34266d97468f741e741c1d7276c5b2e4e13dfc29a884e34ecdb70b18a14ec97b5f0811400a88cec;
      expv[39] = 332'h2ffe3daf9def9fc07ddf3ddb83803fed116670f9833d69e2e450980fdee5316e643c624aa0f26b7bed5;
      expv[40] = 332'hf6d77f5cc46b7af1ef10af0f5d69c2c1f1a5ec02b78a8697d17d1623d2aa064e602fec2276175ebb5ad;
      expv[41] = 332'h712ea18d99574836b6ef76ec2eeb5656fc2e8b88bf82fad4ac811804913c48da61b73b1c8c834d812af;
      expv[42] = 332'hbaed4bb55740f474fa973a960c36f858adea4fdb4648ae90c0695558eef089575aae5ad216bb14fca3f;
      expv[43] = 332'h2b1c2d2dc0f2ec3b47f687f571fa08e2c1079235342583bf82fb0f09b0ff4b3bddcf3a53f7c19ff0b28;
      expv[44] = 332'hf31165d45aea4aea4fbfcfbf85a74893306ef85c35fc27d62f7e9fc98d34c269ed9ea7443ae4301c94c;
      expv[45] = 332'h299255d9adcae80f3ffdfffba3f6985d249b6ea6a5e5ef17f818b0381f99e6e2eacee774a8dd4c569f7;
      expv[46] = 332'he76009673f588a0ed68c568c7acb12e2a0a1c101ed82e551f55c6e69e1371839ea86afd0db3da4cad54;
      expv[47] = 332'he00a280ada688da283ad03ace262bf3154601683c70ea7915e398d6f25849b1dc6251fc704753601c52;
      expv[48] = 332'ha281e22fae6fb3c051291126fc395a47cd7f7ba3bad39deb7298ef81d885a36b1df886ea5488be0cc5d;
      expv[49] = 332'h72f1299fd2c196de83d783d471c147623fe7cc8aadf49a2e7dd07fdf6182010400ae557106f9b440967;
      expv[50] = 332'h77578cceeb656169cea58ea2cf293045f110d10362af87f93eaa865fe55beb764a531a198ec8c97fd88;
      expv[51] = 332'h383c94c1cb388989a96229618ea05c37265a6053c93953d7ff89f26b2bf6b9f04db6cadcbc81b950a0a;
      expv[52] = 332'h4fb81eac489556176848a8455690f2313f5f49b7429c3c3c05a4e8369b016897a0824276626efc74cd9;
      expv[53] = 332'ha0a5ecc6c78a653cf787f787b2d341f531eba16e91f62a969d13811844c5b4eb0411f8836d920da7c2b;
      expv[54] = 332'h0d940f3ef31d1c223071b06f40e40d765f68e520a0a32bfc622ba7ea85da124330d76baacff9033eee5;
      expv[55] = 332'h8833eb09fd2aeddf5fe5dfe464ac1c7bb6f4e4406a3e3f45b1d7642722e8a9c56611314f37f86619fdf;
      expv[56] = 332'h66912bc582aa291be2be62bd69a43090b6d0e34a66c662f6e318cc6987e2f6d719af45f6e11deb24f44;
      expv[57] = 332'h0b29060421c7a43ce26be26b9f3fba08fac817a56a4a3bfe8bd9b3f3c3cf8eda62c988e18673d8e9865;
      expv[58] = 332'h605e4ba08866433a85e2c5e170ac331e3c2115b749656f039c30f4478ec8c12b4f7e7a73a8e91edecb9;
      expv[59] = 332'hf4a8d3be804593794e4a0e465c9586077ab99f0b635da59d5c2cd2b8dcac89375e40a75bb4cc0bf78dd;
      expv[60] = 332'h5c10207233ae2cc47df37df0dc87edc4e66a0fa9446ca08f60467a0de38dc54ec005c58a360071e01ab;
      expv[61] = 332'h671987cf1211f5bdb5877586a40a70bf4645bf947b5c981734fe4e51ea775c61e67025d849827f2c6b8;
      expv[62] = 332'he7f0d5fb51fc83ff1610d60d75331473448625b95ebe54a2d959198420cd773fa49823746329ab5603f;
      expv[63] = 332'h1e39b8d48f25e9af37fb37f9a2e00df2035185224fecbb521348664cd19cdb17f1808ff543e56a50795;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
