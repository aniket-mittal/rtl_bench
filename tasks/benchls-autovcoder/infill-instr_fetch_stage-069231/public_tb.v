// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 140;
  localparam OW = 170;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_069231 dut (
    .clk(clk),
    .rst(in_vec[139:139]),
    .priv(in_vec[138:135]),
    .int_req(in_vec[134:134]),
    .nop_if(in_vec[133:133]),
    .if_hold(in_vec[132:132]),
    .pip_flush(in_vec[131:131]),
    .new_pc(in_vec[130:67]),
    .ins_in(in_vec[66:3]),
    .ins_acc_fault_biu(in_vec[2:2]),
    .ins_page_fault_biu(in_vec[1:1]),
    .cache_ready(in_vec[0:0]),
    .addr(out_vec[169:106]),
    .rd(out_vec[105:105]),
    .if_priv(out_vec[104:101]),
    .ins_out(out_vec[100:69]),
    .ins_pc(out_vec[68:5]),
    .ins_acc_fault(out_vec[4:4]),
    .ins_addr_mis(out_vec[3:3]),
    .ins_page_fault(out_vec[2:2]),
    .int_acc(out_vec[1:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 140'hdf75f3717e5974f1433e730c8cc9d895227;
    stim[1] = 140'hb351d3154697cb6c1e4cc879fcdc1eb0361;
    stim[2] = 140'h1c584ea9b20cfa6bce24f30701ebf978e4c;
    stim[3] = 140'h22ace737d0b3e4068d344675582f11e3c58;
    stim[4] = 140'h7f6ecadc13ed24513113139ff11f889f4c6;
    stim[5] = 140'h70074b303d4afd8fd3c98949b3162b33c13;
    stim[6] = 140'h25f44c5d1f4a73942d33d99a11b127ece55;
    stim[7] = 140'h56106276ade38b879dd4cc166285fe77fa3;
    stim[8] = 140'h785db9e5f8bdd7847cf5bed4168eb4ec627;
    stim[9] = 140'h0ffccb16ff89cd6e07e280760962bc0f87d;
    stim[10] = 140'h78babbd80ea59df11ce8b34e00d8db988c3;
    stim[11] = 140'h364751c71120701100cee776398d56b4681;
    stim[12] = 140'h3aa44557493be1d07217196dba6981b51c4;
    stim[13] = 140'h37985e9674e94827992089f498f1543a963;
    stim[14] = 140'h5b5032f73d81659a741f154ff60f2e7e062;
    stim[15] = 140'h43b6441ea55f5a7679f1c0b302026771b7f;
    stim[16] = 140'h5815ca7899bffd959bded28f894f4078ceb;
    stim[17] = 140'h49ff8a80eccab1d3baa8eace2338009e184;
    stim[18] = 140'h254bf4a03598e46d0304305bbfb95758309;
    stim[19] = 140'h8a90e1f0b2ead5f448ec2c9eab8d3eb1134;
    stim[20] = 140'h48d5a42174050c550652744449c51327344;
    stim[21] = 140'hd6fb047346d4c8d86bbbaea73a1a588e734;
    stim[22] = 140'h4396c7eb644f376a03a246240adb5688a24;
    stim[23] = 140'h2898c7c40a156d3637795d1ea8ed3e0e3f1;
    stim[24] = 140'h0e04b78278146f5c788e111f1338ba389d6;
    stim[25] = 140'h08798cdce3f0f42bddd9d406bb7b16e2209;
    stim[26] = 140'h13c620691da6b1e66961afb6bee76e6b83f;
    stim[27] = 140'h3f3dbef8b655e567c1a2129f8f4e37152a6;
    stim[28] = 140'h028b3cf638a50e608f75937c8eaeaf0579c;
    stim[29] = 140'h5e9f2f42861ed06742a75b21df111a2c40b;
    stim[30] = 140'h32d5d9db573532bacb1821bcf1fefaf8adf;
    stim[31] = 140'h42bcef83f20d1bacb2e876901dc37172c29;
    stim[32] = 140'h0fb218b402f9f692dbff8f69f09e70ce620;
    stim[33] = 140'h33f934b300fa87329d5f6bfd126787ef751;
    stim[34] = 140'h5f9cb49be12c2b3335c53b7620b6e8b0cc5;
    stim[35] = 140'h7ea4138592787ea80350c2077dec8d4549c;
    stim[36] = 140'h60cbe25659144d2d7db4b779c1acd08599d;
    stim[37] = 140'h1797f2484e0d43d00e7813b975612082fe3;
    stim[38] = 140'h5540a8b21c6fdac5e63c6f4702f7c84d840;
    stim[39] = 140'h11171e65c6dd00b4bd41c4aa96fa5494e57;
    stim[40] = 140'h57e8909019e0c76c6ed32a9b1be67f2fb43;
    stim[41] = 140'h41781b59e9a9827605bc13375145fffc56b;
    stim[42] = 140'h3d2b48070bad99c691aa020847a70ce8ec4;
    stim[43] = 140'h611a403132d643002a1e0e1a10b56a3dccd;
    stim[44] = 140'h6e271cd638b20847ab84bba7ae2796a8a2b;
    stim[45] = 140'h42c7834e3cdbd3f9f8ce9551daaa3de12d2;
    stim[46] = 140'h06da98808b8c60926dac9e4bbf52204ab34;
    stim[47] = 140'h60acaacdd761c20df290836508ae6ca0c03;
    stim[48] = 140'h22bf8c2a9238da6a37e9885ae62745c2732;
    stim[49] = 140'h3b34401be4de83bdf6ae562270003464df8;
    stim[50] = 140'h2ee98997f7a3a033f187d0d52cd876a3981;
    stim[51] = 140'h79f0b4b52aebe822c1c7f05324b271e16a2;
    stim[52] = 140'h7bf042c6bf945b6c28ddf1ff300fdd3730a;
    stim[53] = 140'h19b7dcd89c5e23f41afcac08219fa18c129;
    stim[54] = 140'h7aef21b3ee9e238dc14dbdd9e0897c7366b;
    stim[55] = 140'h73aa6f40e43c6d0de6eb0b0f8a50318ddcb;
    stim[56] = 140'h7799d0e8159f4f9ef5fe0818f3d68201985;
    stim[57] = 140'h26aabd1e214093027891877270a89bb7d07;
    stim[58] = 140'h1abd36c2cd592b8a61dd3cd53bd05b606ff;
    stim[59] = 140'h70fcfb1711603b520302e62a578b294d4d6;
    stim[60] = 140'h2b8ff94c30cbe556417c4407b2afca7a43a;
    stim[61] = 140'h5e9baed2a35da6defbb64a18a890eeb6dfb;
    stim[62] = 140'h05ed042e3eefcfb06a0ac26f3c5fce4fddf;
    stim[63] = 140'h4943e58eb765bed497fcad9654911abc1fa;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 170'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 170'h00000000000000000d707ac0d800000000000000000;
      expv[2] = 170'h000000000000000027afe5e39200000000000000000;
      expv[3] = 170'h000000000000000008bc478f1600000000000000012;
      expv[4] = 170'h16739be859f203469e7e227d3000000000000000000;
      expv[5] = 170'h16739be859f20346bc7e227d3000000000000000000;
      expv[6] = 170'h16739be859f2034788c49fb394b39cdf42cf901a34d;
      expv[7] = 170'h3a262e8fa539ca1694c49fb394b39cdf42cf901a34c;
      expv[8] = 170'h3a262e8fa539ca16be3ad3b189d131747d29ce50b4e;
      expv[9] = 170'h3a262e8fa539ca17838af03e1fd131747d29ce50b5c;
      expv[10] = 170'h3e658b7fc4e6b703ff8af03e1fd131747d29ce50b5c;
      expv[11] = 170'h1d5dec0752cef88e4d3b9dd8e7f32c5bfe2735b81ec;
      expv[12] = 170'h1d5dec0752cef88e4fa606d470eaef603a9677c472a;
      expv[13] = 170'h1222aba49df0e8390dc550ea58eaef603a9677c4738;
      expv[14] = 170'h0c2f4b3a74a413cc97c550ea58eaef603a9677c4738;
      expv[15] = 170'h0c2f4b3a74a413cc91c550ea58eaef603a9677c4738;
      expv[16] = 170'h1b220f52afad3b3cf7c550ea58eaef603a9677c4738;
      expv[17] = 170'h1b220f52afad3b3dd2e0027860d9107a957d69d9e6c;
      expv[18] = 170'h3fc540766558e9dd48e0027860d9107a957d69d9e6c;
      expv[19] = 170'h3fc540766558e9dd42e0027860d9107a957d69d9e6c;
      expv[20] = 170'h000000000000000033144c9cd000000000000000000;
      expv[21] = 170'h2ad210ba02862a8314696239cc00000000000000010;
      expv[22] = 170'h0000000000000000116d5a228800000000000000000;
      expv[23] = 170'h0b63f5b2279bb501eb6d5a228800000000000000000;
      expv[24] = 170'h0c63e2050ab69b1b8238447c4c5b1fad913cdda80e9;
      expv[25] = 170'h0c63e2050ab69b1ba367501aec631f102855b4d8dde;
      expv[26] = 170'h0c63e2050ab69b1c8586bedafa631f102855b4d8dc8;
      expv[27] = 170'h2310348ed358f3348f86bedafa631f102855b4d8dc8;
      expv[28] = 170'h2310348ed358f3348186bedafa631f102855b4d8dc8;
      expv[29] = 170'h059e7b1c52873047964468b1031881a4769ac799a58;
      expv[30] = 170'h0f97a1430f6833a14c6086f3c62cf3d8e29439823ce;
      expv[31] = 170'h2aecedab9a995d6591a1da40767cbd0a187b419d0bc;
      expv[32] = 170'h1e77c1f9068dd65943fe3da7c357676d5cd4caeb2c8;
      expv[33] = 170'h190c5a017cfb496dcdfe3da7c357676d5cd4caeb2c8;
      expv[34] = 170'h3c9a59807d43994e97fe3da7c357676d5cd4caeb2c8;
      expv[35] = 170'h0e5a4df09615999adffe3da7c357676d5cd4caeb2c8;
      expv[36] = 170'h1209c2c93c3f5401b8b342166672d26f84b0acccd7a;
      expv[37] = 170'h25f12b2c8a2696bec5e04ee5d4904e1649e1faa00d8;
      expv[38] = 170'h0bf9242706a1e80715e04ee5d4904e1649e1faa00d8;
      expv[39] = 170'h0bf9242706a1e80705e04ee5d4904e1649e1faa00d8;
      expv[40] = 170'h0bf9242706a1e80715e04ee5d4904e1649e1faa00d8;
      expv[41] = 170'h3448480cf063b63751e04ee5d4904e1649e1faa00d8;
      expv[42] = 170'h3448480cf063b6374fe04ee5d4904e1649e1faa00d8;
      expv[43] = 170'h3448480cf063b63759e04ee5d4904e1649e1faa00d8;
      expv[44] = 170'h3448480cf063b6375be04ee5d4904e1649e1faa00d8;
      expv[45] = 170'h3448480cf063b637513a55476ba2424067831db1bae;
      expv[46] = 170'h23c1a71e6de9fcfc40b2792efda2424067831db1bac;
      expv[47] = 170'h2d4c4045c6304936f8b9b283011e0d38f36f4fe7e3a;
      expv[48] = 170'h165566ebb0e106f9489d1709cd6a62022e318249b6c;
      expv[49] = 170'h1fc615491c6d351bceb95889c0b2ab375d870837cac;
      expv[50] = 170'h1fc615491c6d351bcab95889c0b2ab375d870837cac;
      expv[51] = 170'h34c4cbfbd1d019f8df1fc14c92fe30aa48e369a8dea;
      expv[52] = 170'h385a5a9575f41160df1fc14c92fe30aa48e369a8dea;
      expv[53] = 170'h3821635fca2db614471fc14c92fe30aa48e369a8dea;
      expv[54] = 170'h1bee6c4e2f11fa0d5f1fc14c92fe30aa48e369a8dea;
      expv[55] = 170'h3790d9f74f11c6e09dac2c3e28df736271788fd06ac;
      expv[56] = 170'h1537a0721e3686f35dac2c3e28df736271788fd06ac;
      expv[57] = 170'h0ce8740acfa7cf7ac9ac2c3e28df736271788fd06ac;
      expv[58] = 170'h155e8f10a049813c47416d81be6743a0567d3e7bd7e;
      expv[59] = 170'h1e9b6166ac95c530fc2ca53534aaf47885024c09e3c;
      expv[60] = 170'h3e7d8b88b01da9018abf29e90ef4db0b3564ae2987c;
      expv[61] = 170'h07fca61865f2ab2096bf29e90ef4db0b3564ae2987c;
      expv[62] = 170'h0dd76951aed36f7dc17f393f763fe530c32f955904e;
      expv[63] = 170'h3682171f77e7d835137f393f763fe530c32f955904e;
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
