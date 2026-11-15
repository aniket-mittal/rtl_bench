// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 91;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00331 dut (
    .clk(clk),
    .rst(in_vec[90:90]),
    .rdport1_ctrl_add(in_vec[89:86]),
    .rdport2_ctrl_add(in_vec[85:82]),
    .rdport3_ctrl_add(in_vec[81:78]),
    .rdport4_ctrl_add(in_vec[77:74]),
    .wrport1_ctrl_add(in_vec[73:70]),
    .wrport1_data_in(in_vec[69:38]),
    .wrport1_wren(in_vec[37:37]),
    .wrport2_ctrl_add(in_vec[36:33]),
    .wrport2_data_in(in_vec[32:1]),
    .wrport2_wren(in_vec[0:0]),
    .rdport1_data_out(out_vec[127:96]),
    .rdport2_data_out(out_vec[95:64]),
    .rdport3_data_out(out_vec[63:32]),
    .rdport4_data_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 91'h530f7232bd6e334ed5b0d34;
    stim[1] = 91'h78bb849f2dc3e91889c5d33;
    stim[2] = 91'h3c1a73b913b3d992e0eca21;
    stim[3] = 91'h3969e25aacba0fb477f288d;
    stim[4] = 91'h3c4c2fc4bb964be740c24f1;
    stim[5] = 91'h1bca4157590c663bd7f4483;
    stim[6] = 91'h24b1f9b313406e7f1b62a39;
    stim[7] = 91'h1c4825b4192cb65bb376418;
    stim[8] = 91'h1810a28347cbc44c6c0b4e9;
    stim[9] = 91'h3c0ed3b0770820bab610f83;
    stim[10] = 91'h1b9b413c405387b84f9e9fb;
    stim[11] = 91'h271eda00c7818a013898a2a;
    stim[12] = 91'h1b8fa9cf8dbdcde381f1efe;
    stim[13] = 91'h09142faa49d1db389f74e74;
    stim[14] = 91'h188b42d44b8ed5f86bccbdd;
    stim[15] = 91'h3b888aa4459c52fac4164f5;
    stim[16] = 91'h1985c24618443db3b3d9e5a;
    stim[17] = 91'h33ff5c9b570a5b7de53d585;
    stim[18] = 91'h1b2bad475983586d0c568aa;
    stim[19] = 91'h0bd8aaea4b6a815e24af0ed;
    stim[20] = 91'h2a55746ae8b56d36789abe6;
    stim[21] = 91'h29a9333bb632095228c18bf;
    stim[22] = 91'h126d7863c098b57ba0646f0;
    stim[23] = 91'h3fde49114aad978b7aaf6fc;
    stim[24] = 91'h325afc57301d05ab58daf4d;
    stim[25] = 91'h19ee5a86cd3e34f4c65010d;
    stim[26] = 91'h2908df87ebccc1124e54e73;
    stim[27] = 91'h015db876fdd3697f34b40f2;
    stim[28] = 91'h3a7565e4d0331f0983d8d7b;
    stim[29] = 91'h38bab81e4e9c171d2e98654;
    stim[30] = 91'h206579ae404dc6badc6a9c0;
    stim[31] = 91'h7fa3b6aa183a6d6f3d79700;
    stim[32] = 91'h3f217ebe16ce75eb1858091;
    stim[33] = 91'h1d4419c65a6c3a2d04caf39;
    stim[34] = 91'h391d5871b31489264ec5f8b;
    stim[35] = 91'h01c15f7c1c4740715427a6e;
    stim[36] = 91'h151311021c44d27c7ffae7a;
    stim[37] = 91'h24ca0a8d5c630cf629d9508;
    stim[38] = 91'h1c2aa7bbd7413c212d0ce60;
    stim[39] = 91'h3540bfc4501b6ef33692638;
    stim[40] = 91'h11eac54dac1851fd0902d8e;
    stim[41] = 91'h4d3496f8139a62f64daa979;
    stim[42] = 91'h3a5cc98a1a5af766a28d16f;
    stim[43] = 91'h29a5f20f5af42ba3d5661e1;
    stim[44] = 91'h0ac5362b8c9df82c94f3892;
    stim[45] = 91'h0f43e957af099c2852492e3;
    stim[46] = 91'h203fb3b256350f4534337c3;
    stim[47] = 91'h0bbf251da81c11dbbef3f2e;
    stim[48] = 91'h00dd720acce98ee3f4f7e43;
    stim[49] = 91'h3746d4430cc1c457fc13a0b;
    stim[50] = 91'h35b38a2568e3621f28aae62;
    stim[51] = 91'h33dcf5b44ccc84d1ba6b593;
    stim[52] = 91'h18720b9231816ea2b435c0a;
    stim[53] = 91'h3dae5a1222978198bed68f4;
    stim[54] = 91'h1b01d0c5ca13bf8523c6938;
    stim[55] = 91'h3f2c8a608f6b1332129e16f;
    stim[56] = 91'h02526065aab5af1c0ea2d26;
    stim[57] = 91'h3a482de862ea45de8bdd3ac;
    stim[58] = 91'h2fd0ba572a1aea2161a961f;
    stim[59] = 91'h1edf5e7e652a395cef93df2;
    stim[60] = 91'h150f0eec12db4da4e108f54;
    stim[61] = 91'h0976f97bce2ba39c6546f6d;
    stim[62] = 91'h0d57ae4420ded78f9e7d01a;
    stim[63] = 91'h2e5955cf587a19f597a1ff6;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'h00000000000000000000000000000000;
      expv[2] = 128'h00000000000000000000000000000000;
      expv[3] = 128'h00000000000000000000000000000000;
      expv[4] = 128'h00000000000000000000000000000000;
      expv[5] = 128'h000000003a0612780000000000000000;
      expv[6] = 128'h0000000000000000ee44ecf600000000;
      expv[7] = 128'h00000000debfa2410000000055d64319;
      expv[8] = 128'h0000000055d643190000000000000000;
      expv[9] = 128'h3a06127855d64319f8db151cf12ee592;
      expv[10] = 128'h000000006cc4d01b00000000a3bf9446;
      expv[11] = 128'h6d064b2dee44ecf600000000f12ee592;
      expv[12] = 128'h8031e0626cc4d01bf8db151c6cc4d01b;
      expv[13] = 128'h00000000ec1dc208000000004f1014e1;
      expv[14] = 128'h8031e0620000000000000000c27cf4fd;
      expv[15] = 128'h6cc4d01b6cc4d01b0000000000000000;
      expv[16] = 128'h8031e0628031e062debfa241d620b27a;
      expv[17] = 128'hee44ecf63a0612783a061278c27cf4fd;
      expv[18] = 128'h8031e062ee44ecf6000000006cc4d01b;
      expv[19] = 128'ha91167143a0612788031e062a9116714;
      expv[20] = 128'hba92daa06d064b2d0000000000000000;
      expv[21] = 128'hba92daa08031e062ba92daa0ec1dc208;
      expv[22] = 128'hec1dc2086d064b2def29eac200000000;
      expv[23] = 128'h3a0612783a06127826d5c2966d064b2d;
      expv[24] = 128'hceed8c826d064b2d8031e062ef29eac2;
      expv[25] = 128'h8031e06226d5c296ef29eac26d064b2d;
      expv[26] = 128'hba92daa0ec1dc2084452ab65f8db151c;
      expv[27] = 128'hb512e3b500000000e1faf330a1b34f8d;
      expv[28] = 128'h6cc4d01b6d064b2dc27cf4fd00000000;
      expv[29] = 128'h6cc4d01b4452ab656cc4d01bba92daa0;
      expv[30] = 128'h4c1ec6bddebfa24179340cc700000000;
      expv[31] = 128'h15cc07416b9013714c1ec6bd6b901371;
      expv[32] = 128'h00000000000000000000000000000000;
      expv[33] = 128'h00000000000000000000000000000000;
      expv[34] = 128'h00000000000000000000000000000000;
      expv[35] = 128'h00000000000000000000000000000000;
      expv[36] = 128'h00000000000000000000000000000000;
      expv[37] = 128'h00000000000000000000000000000000;
      expv[38] = 128'h00000000000000000000000000000000;
      expv[39] = 128'h00000000000000000000000000000000;
      expv[40] = 128'h40871134000000000000000000000000;
      expv[41] = 128'h00000000408711340000000000000000;
      expv[42] = 128'h00000000000000000000000000000000;
      expv[43] = 128'h00000000000000000000000000000000;
      expv[44] = 128'h628696bd351468b70000000000000000;
      expv[45] = 128'h000000001eab30f00000000000000000;
      expv[46] = 128'h00000000000000000000000000000000;
      expv[47] = 128'h628696bd0000000000000000ec958d43;
      expv[48] = 128'h00000000000000000000000000000000;
      expv[49] = 128'h1eab30f01eab30f000000000351468b7;
      expv[50] = 128'h1eab30f00000000082b33a6300000000;
      expv[51] = 128'h82b33a63000000001fa7bf2100000000;
      expv[52] = 128'h000000000000000082b33a6300000000;
      expv[53] = 128'h0000000000000000351468b700000000;
      expv[54] = 128'h0000000082b33a63000000001fa7bf21;
      expv[55] = 128'h0000000082b33a63351468b7e48c605b;
      expv[56] = 128'h000000009094f0b7317284ef9094f0b7;
      expv[57] = 128'h000000009094f0b79823dac400000000;
      expv[58] = 128'h351468b700000000317284ef9823dac4;
      expv[59] = 128'h1fa7bf21351468b71fa7bf216d133321;
      expv[60] = 128'h10c33071317284ef0000000082b33a63;
      expv[61] = 128'h9823dac410c330716d133321351468b7;
      expv[62] = 128'h0000000010c3307110c330715ef38ae8;
      expv[63] = 128'h910837b59094f0b70000000010c33071;
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
