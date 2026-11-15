// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 80;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06422 dut (
    .clk(clk),
    .rst(in_vec[79:79]),
    .reg_R_addr(in_vec[78:74]),
    .reg_W_addr(in_vec[73:69]),
    .wdata(in_vec[68:37]),
    .pc_i(in_vec[36:5]),
    .reg_we(in_vec[4:4]),
    .EPCWrite(in_vec[3:3]),
    .CauseWrite(in_vec[2:2]),
    .IntCause(in_vec[1:0]),
    .rdata(out_vec[63:32]),
    .epc_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 80'hf5af58264b6e111234ea;
    stim[1] = 80'h8c8cbf6b541756b34ddc;
    stim[2] = 80'h452c69b278cdda66a441;
    stim[3] = 80'h661db72f7c388fad3605;
    stim[4] = 80'h4e6dc6019660089018df;
    stim[5] = 80'h3944f41067511eabaee8;
    stim[6] = 80'h1d19ab09a607130dbb4a;
    stim[7] = 80'h4561f58faa6466aab630;
    stim[8] = 80'h72b9906cf5ec2d86e007;
    stim[9] = 80'h110343b288a1f784db2c;
    stim[10] = 80'h051a1aad73f6e4bd271d;
    stim[11] = 80'h2d0c12a2b504cab35267;
    stim[12] = 80'h2a9363de18868d833705;
    stim[13] = 80'h1b62521aeca1d8779b74;
    stim[14] = 80'h24e0df2b5b42bc22a214;
    stim[15] = 80'h50d9d91d92e1242a1caa;
    stim[16] = 80'h243788db81ff26d2333d;
    stim[17] = 80'h4e69c34bdda5e7b08248;
    stim[18] = 80'h65c2f64e28fd0687a859;
    stim[19] = 80'h5f2dd30d69401d6442db;
    stim[20] = 80'h197474fba22842407079;
    stim[21] = 80'h0105800187d4858a171a;
    stim[22] = 80'h17ccc62ac9f9f7d7afdc;
    stim[23] = 80'h1c1b152d56b8527f3db1;
    stim[24] = 80'h011144b0b7d664de2f1c;
    stim[25] = 80'h1d884815bc3f19f9b045;
    stim[26] = 80'h37c52b2458d333d85c0e;
    stim[27] = 80'h0ac3313d0837db438e74;
    stim[28] = 80'h45d51881a638244ca33e;
    stim[29] = 80'h560a71a33796e7dbc526;
    stim[30] = 80'h63307c1b389f71e3e35f;
    stim[31] = 80'h7310c3539944cfa5298d;
    stim[32] = 80'h18dbe85830dd619a0d9e;
    stim[33] = 80'h36c939b3990ed9403ca9;
    stim[34] = 80'h2fa976c6b0075c5d7f60;
    stim[35] = 80'h04c5168d9b952f964214;
    stim[36] = 80'h7f391487a975bb2950c7;
    stim[37] = 80'h185e55e7ce9342e6f329;
    stim[38] = 80'h36249da7955deea5bf77;
    stim[39] = 80'h760f492023466fc40c83;
    stim[40] = 80'h4d546315c7ca9b05b109;
    stim[41] = 80'h116929d4ec2694f00ffa;
    stim[42] = 80'h7f9f848cceca03213838;
    stim[43] = 80'h4ac30d185d9fcb50825a;
    stim[44] = 80'h4227153cb4522e8bf6c3;
    stim[45] = 80'h2928bac2c8aaeb5d96e9;
    stim[46] = 80'h449b03e0b373d0e1c9a1;
    stim[47] = 80'h3ecfef8b331cc21ca1d6;
    stim[48] = 80'h78e6317b07a32c1adbf3;
    stim[49] = 80'h65fcb11c91f7ba2ea11b;
    stim[50] = 80'h01d509c6ebe9e54e6c9a;
    stim[51] = 80'h094bb2403aed9fdf7d77;
    stim[52] = 80'h285c7e5fc30532414718;
    stim[53] = 80'h12ea369fa9baf40e6add;
    stim[54] = 80'h0c63d5f578f97e06a3db;
    stim[55] = 80'h56d97b76ceced19468b2;
    stim[56] = 80'hbcac6c6d511417f72b15;
    stim[57] = 80'h419a0347eee9e7ad330d;
    stim[58] = 80'h02bec33860f1abd14fe0;
    stim[59] = 80'h043561b938f51723d1ef;
    stim[60] = 80'h24dd630d69c3b175cc86;
    stim[61] = 80'h2f48b2e4c61a9b53f3b6;
    stim[62] = 80'h359ba4dc2180e5f2e497;
    stim[63] = 80'h4aa9e173b1ef38705849;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'h004480c6004480c6;
      expv[6] = 64'hxxxxxxxx88f55d77;
      expv[7] = 64'hxxxxxxxx38986dda;
      expv[8] = 64'hxxxxxxxx38986dda;
      expv[9] = 64'hxxxxxxxx38986dda;
      expv[10] = 64'hxxxxxxxx0fbc26d9;
      expv[11] = 64'hxxxxxxxxb725e938;
      expv[12] = 64'hxxxxxxxxb725e938;
      expv[13] = 64'hxxxxxxxxb725e938;
      expv[14] = 64'hxxxxxxxxb725e938;
      expv[15] = 64'hxxxxxxxxb725e938;
      expv[16] = 64'hxxxxxxxx092150e5;
      expv[17] = 64'hxxxxxxxxf9369199;
      expv[18] = 64'hxxxxxxxx2f3d8412;
      expv[19] = 64'hxxxxxxxxe8343d42;
      expv[20] = 64'hxxxxxxxx00eb2216;
      expv[21] = 64'hxxxxxxxx42120383;
      expv[22] = 64'hxxxxxxxxa42c50b8;
      expv[23] = 64'hxxxxxxxxcfbebd7e;
      expv[24] = 64'hxxxxxxxxcfbebd7e;
      expv[25] = 64'hxxxxxxxxb326f178;
      expv[26] = 64'h00000001b326f178;
      expv[27] = 64'hxxxxxxxx999ec2e0;
      expv[28] = 64'hxxxxxxxx999ec2e0;
      expv[29] = 64'hxxxxxxxxc1226519;
      expv[30] = 64'hxxxxxxxxc1226519;
      expv[31] = 64'hxxxxxxxxfb8f1f1a;
      expv[32] = 64'hxxxxxxxx267d294c;
      expv[33] = 64'h00000002eb0cd06c;
      expv[34] = 64'hxxxxxxxx76ca01e5;
      expv[35] = 64'hxxxxxxxx76ca01e5;
      expv[36] = 64'hxxxxxxxx76ca01e5;
      expv[37] = 64'hxxxxxxxx76ca01e5;
      expv[38] = 64'h000000039a173799;
      expv[39] = 64'hxxxxxxxx9a173799;
      expv[40] = 64'hxxxxxxxx9a173799;
      expv[41] = 64'hxxxxxxxx54d82d88;
      expv[42] = 64'hxxxxxxxx34a7807f;
      expv[43] = 64'hxxxxxxxx501909c1;
      expv[44] = 64'hxxxxxxxxfe5a8412;
      expv[45] = 64'hxxxxxxxxfe5a8412;
      expv[46] = 64'hxxxxxxxx575aecb7;
      expv[47] = 64'hxxxxxxxx575aecb7;
      expv[48] = 64'hxxxxxxxx575aecb7;
      expv[49] = 64'hxxxxxxxx575aecb7;
      expv[50] = 64'hxxxxxxxxbdd17508;
      expv[51] = 64'hxxxxxxxx4f2a7364;
      expv[52] = 64'hxxxxxxxx4f2a7364;
      expv[53] = 64'hxxxxxxxx29920a38;
      expv[54] = 64'hxxxxxxxxd7a07356;
      expv[55] = 64'hxxxxxxxxcbf0351e;
      expv[56] = 64'hxxxxxxxxcbf0351e;
      expv[57] = 64'hxxxxxxxxcbf0351e;
      expv[58] = 64'hxxxxxxxx4f3d6998;
      expv[59] = 64'hxxxxxxxx4f3d6998;
      expv[60] = 64'hxxxxxxxxa8b91e8f;
      expv[61] = 64'hxxxxxxxxa8b91e8f;
      expv[62] = 64'h00000002a8b91e8f;
      expv[63] = 64'hxxxxxxxxa8b91e8f;
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
