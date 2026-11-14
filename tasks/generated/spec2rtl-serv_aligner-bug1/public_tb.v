// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .i_ibus_adr(in_vec[65:34]),
    .i_ibus_cyc(in_vec[33:33]),
    .i_wb_ibus_rdt(in_vec[32:1]),
    .i_wb_ibus_ack(in_vec[0:0]),
    .o_ibus_rdt(out_vec[65:34]),
    .o_ibus_ack(out_vec[33:33]),
    .o_wb_ibus_adr(out_vec[32:1]),
    .o_wb_ibus_cyc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h40f9b03f618f16c38;
    stim[1] = 67'h7e282644287bfeddb;
    stim[2] = 67'h3352b3af905b5c0cf;
    stim[3] = 67'h120d0d6a63be2bb5b;
    stim[4] = 67'h3ebf9c49da3bf9ed1;
    stim[5] = 67'h32c17ce7074de41c8;
    stim[6] = 67'h3c8a9e171a97b9f9e;
    stim[7] = 67'h0a258cef93b08af0b;
    stim[8] = 67'h16ae5eb74206d806d;
    stim[9] = 67'h13fa43bb0dc9041df;
    stim[10] = 67'h24c018e1f6b622f15;
    stim[11] = 67'h1cc645162e26c2273;
    stim[12] = 67'h2663d68e478540374;
    stim[13] = 67'h01d392fc0fa58cdea;
    stim[14] = 67'h06099eb19cf93e09b;
    stim[15] = 67'h1d34fe97a61feacdc;
    stim[16] = 67'h3bb7e9c15e0965a6d;
    stim[17] = 67'h2de2ac36b0c6173a3;
    stim[18] = 67'h3286b18cd0d400af0;
    stim[19] = 67'h345bdecbe4a65b555;
    stim[20] = 67'h0819588895cbe16a5;
    stim[21] = 67'h3f3c4a376f7487e2b;
    stim[22] = 67'h2cb2a795f9678695d;
    stim[23] = 67'h2108d5cc8622c68ac;
    stim[24] = 67'h156fa6050464677c6;
    stim[25] = 67'h38bce05201c08833c;
    stim[26] = 67'h3ea2175a5c8756315;
    stim[27] = 67'h1cab04b71eb3bd1c1;
    stim[28] = 67'h2e45316486b6be94f;
    stim[29] = 67'h1bda8a2007463217c;
    stim[30] = 67'h75a20a3406d9ab3e4;
    stim[31] = 67'h2167fe684f325a08d;
    stim[32] = 67'h12b2619bfeed46bdf;
    stim[33] = 67'h173c32e5bd3d3c66b;
    stim[34] = 67'h135100f31e13585e1;
    stim[35] = 67'h388eb4c3bcb59281a;
    stim[36] = 67'h0636d9cda5f43cec6;
    stim[37] = 67'h296cd529558bf08da;
    stim[38] = 67'h1d02b1c3b2264763f;
    stim[39] = 67'h2716d4c59566096f2;
    stim[40] = 67'h395eb4bc706429348;
    stim[41] = 67'h222602346b53cb20d;
    stim[42] = 67'h1d59760ce5c885f8f;
    stim[43] = 67'h0e57f1b9540342220;
    stim[44] = 67'h159c2a0250d9cf64b;
    stim[45] = 67'h3660a0bbf1da77c70;
    stim[46] = 67'h02eca6a9e0abda6e1;
    stim[47] = 67'h0b101e2d3e34627c6;
    stim[48] = 67'h3a7bb048e80b73cb0;
    stim[49] = 67'h1205a35e4b23cd017;
    stim[50] = 67'h36ea9ecdd02ae9e97;
    stim[51] = 67'h2e470e60e898501cd;
    stim[52] = 67'h2b8874f84b670dbf8;
    stim[53] = 67'h180f3fe570d557a6a;
    stim[54] = 67'h1843d2e7543d5776d;
    stim[55] = 67'h69e7f79a3826a005d;
    stim[56] = 67'h345bcee8cad22f8e1;
    stim[57] = 67'h1f1068e7b01fd78b6;
    stim[58] = 67'h151f98aaf63e7cfc0;
    stim[59] = 67'h20967a760d1b892ff;
    stim[60] = 67'h35b3f10e0d3463fc4;
    stim[61] = 67'h37695e1274588424c;
    stim[62] = 67'h1d6f998b2c7f97d0a;
    stim[63] = 67'h3212962031b0949d7;
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
      expv[0] = 66'hxxxxxxxxx07cd81fx;
      expv[1] = 66'h10f7fdbb7f1413221;
      expv[2] = 66'h20b6b819d9a959d7c;
      expv[3] = 66'h176b60b6a90686b57;
      expv[4] = 66'h33da077c7f5fce252;
      expv[5] = 66'h0e9bc8391960be738;
      expv[6] = 66'h352f73f3de454f0b8;
      expv[7] = 66'h276115e14512c677c;
      expv[8] = 66'h300da7612b572f5be;
      expv[9] = 66'h083bc40da9fd21ddc;
      expv[10] = 66'h05e29b9232600c713;
      expv[11] = 66'h1c4d844e6e63228b1;
      expv[12] = 66'h0f0a806e9331eb472;
      expv[13] = 66'h1f4b19bd40e9c97e0;
      expv[14] = 66'h39f27c134304cf58c;
      expv[15] = 66'h159bb9f24e9a7f4c1;
      expv[16] = 66'h0b4db9f27ddbf4e0e;
      expv[17] = 66'h2e747c12f6f1561b9;
      expv[18] = 66'h21a8015e194358c66;
      expv[19] = 66'h094cb6aa9a2def65f;
      expv[20] = 66'h02d4894ca40cac448;
      expv[21] = 66'h1ee90fc57f9e251bb;
      expv[22] = 66'h32cf0d2b965953caf;
      expv[23] = 66'h0d15b2cf10846ae68;
      expv[24] = 66'h0ef8f2cf0ab7d302c;
      expv[25] = 66'h1067b2cf1c5e70294;
      expv[26] = 66'h2c62b2cf3f510bad6;
      expv[27] = 66'h3a38390eae55825bc;
      expv[28] = 66'h3d29fd67772298b28;
      expv[29] = 66'h0e8c642f8ded45100;
      expv[30] = 66'h0db3567c9ad1051a0;
      expv[31] = 66'h1e64b411b0b3ff342;
      expv[32] = 66'h3dda8d7bc95930cdf;
      expv[33] = 66'h38cd7ddaab9e19731;
      expv[34] = 66'h3c26b0bc29a880798;
      expv[35] = 66'h396b25035c475a61d;
      expv[36] = 66'h0be879d8c31b6ce6d;
      expv[37] = 66'h2b17e11b54b66a94a;
      expv[38] = 66'h244c8ec7ce8158e1d;
      expv[39] = 66'h12de644c938b6a630;
      expv[40] = 66'h1269244c9caf5a5e7;
      expv[41] = 66'h1641a44cb113011a7;
      expv[42] = 66'h0bf1d6a7aeacbb06b;
      expv[43] = 66'h28068444072bf8dca;
      expv[44] = 66'h21b39ec96ace15012;
      expv[45] = 66'h23b4ef8e1b30505df;
      expv[46] = 66'h0157b4dc01765354f;
      expv[47] = 66'h04f8c15785880f16d;
      expv[48] = 66'h279601579d3dd824b;
      expv[49] = 66'h1a02c157a902d1af6;
      expv[50] = 66'h13d2d647bb754f672;
      expv[51] = 66'h1130a039972387307;
      expv[52] = 66'h1b7f113095c43a7c6;
      expv[53] = 66'h2f4d51308c079ff2f;
      expv[54] = 66'h2eed9130ac21e973e;
      expv[55] = 66'h000ba87ab4f3fbcd5;
      expv[56] = 66'h15a45f1c1a2de7746;
      expv[57] = 66'h2f16d5a44f8834741;
      expv[58] = 66'h39f815a44a8fcc55b;
      expv[59] = 66'h125fd5a4704b3d3b4;
      expv[60] = 66'h07f89a371ad9f8874;
      expv[61] = 66'h08499a371bb4af097;
      expv[62] = 66'h2fa15a370eb7ccc5d;
      expv[63] = 66'h293ada3739094b105;
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
