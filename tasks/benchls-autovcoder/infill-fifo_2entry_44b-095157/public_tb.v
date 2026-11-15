// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_095157 dut (
    .clk(clk),
    .rd(in_vec[46:46]),
    .reset_n(in_vec[45:45]),
    .wr(in_vec[44:44]),
    .wr_data(in_vec[43:0]),
    .almost_empty(out_vec[47:47]),
    .almost_full(out_vec[46:46]),
    .empty(out_vec[45:45]),
    .full(out_vec[44:44]),
    .rd_data(out_vec[43:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h50ab6fbabfff;
    stim[1] = 47'h01756cee468c;
    stim[2] = 47'h38d92647c66d;
    stim[3] = 47'h6e4e77a38607;
    stim[4] = 47'h6c4ad32a092a;
    stim[5] = 47'h7ba744d1f10e;
    stim[6] = 47'h23dd9d8d6a44;
    stim[7] = 47'h798941787b4d;
    stim[8] = 47'h73bc140380d4;
    stim[9] = 47'h3706453cf2ee;
    stim[10] = 47'h36ee22b8dfa0;
    stim[11] = 47'h60deedb4c490;
    stim[12] = 47'h36014b0dafd6;
    stim[13] = 47'h7e9c67811cab;
    stim[14] = 47'h631c2e6aa02e;
    stim[15] = 47'h2f50923331da;
    stim[16] = 47'h2ca6c893caf3;
    stim[17] = 47'h296db1cd5e52;
    stim[18] = 47'h71d18682d487;
    stim[19] = 47'h73f85ec0fcc1;
    stim[20] = 47'h2c8d8fe749aa;
    stim[21] = 47'h637ae3f07046;
    stim[22] = 47'h7d4a3a0909c5;
    stim[23] = 47'h39516b8e8f86;
    stim[24] = 47'h69261dc201ec;
    stim[25] = 47'h710c3e60adb2;
    stim[26] = 47'h6447d1c8b545;
    stim[27] = 47'h73f2c389bc64;
    stim[28] = 47'h2e0d34c58419;
    stim[29] = 47'h3770107473e0;
    stim[30] = 47'h219328f41e81;
    stim[31] = 47'h3f0c4b74e1d2;
    stim[32] = 47'h32abc3ce4e58;
    stim[33] = 47'h34f01f5b5587;
    stim[34] = 47'h21eed26c11f5;
    stim[35] = 47'h706bf497a2fa;
    stim[36] = 47'h3590186ca879;
    stim[37] = 47'h6948497502f6;
    stim[38] = 47'h6da8d6db003c;
    stim[39] = 47'h68ad39a15e19;
    stim[40] = 47'h6f6034c83fb3;
    stim[41] = 47'h2d3ddfcebfcd;
    stim[42] = 47'h63270b928ed8;
    stim[43] = 47'h327433aca15f;
    stim[44] = 47'h2e9824294d3f;
    stim[45] = 47'h216739ed122d;
    stim[46] = 47'h3712f960dfcc;
    stim[47] = 47'h335a673b5aa5;
    stim[48] = 47'h36a22aca3c7e;
    stim[49] = 47'h13865336bff7;
    stim[50] = 47'h6a94283646ce;
    stim[51] = 47'h72011cbc0396;
    stim[52] = 47'h250d387084f3;
    stim[53] = 47'h2f83e8fc4b38;
    stim[54] = 47'h3b1d7ebd2bf5;
    stim[55] = 47'h6e4bf1c7db31;
    stim[56] = 47'h277bc6d6d28d;
    stim[57] = 47'h3257073f50b5;
    stim[58] = 47'h68afeaca6ddb;
    stim[59] = 47'h32c6b7ce5062;
    stim[60] = 47'h34d0c5a6fb83;
    stim[61] = 47'h7bce3ccf8661;
    stim[62] = 47'h3415aadd84a5;
    stim[63] = 47'h3a042dbce651;
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
      expv[0] = 48'haxxxxxxxxxxx;
      expv[1] = 48'ha0ab6fbabfff;
      expv[2] = 48'ha0ab6fbabfff;
      expv[3] = 48'hc8d92647c66d;
      expv[4] = 48'haxxxxxxxxxxx;
      expv[5] = 48'haxxxxxxxxxxx;
      expv[6] = 48'ha8d92647c66d;
      expv[7] = 48'ha8d92647c66d;
      expv[8] = 48'haba744d1f10e;
      expv[9] = 48'ha98941787b4d;
      expv[10] = 48'hc706453cf2ee;
      expv[11] = 48'h5706453cf2ee;
      expv[12] = 48'hc6ee22b8dfa0;
      expv[13] = 48'h56ee22b8dfa0;
      expv[14] = 48'h56014b0dafd6;
      expv[15] = 48'hc6ee22b8dfa0;
      expv[16] = 48'hc6ee22b8dfa0;
      expv[17] = 48'hc6ee22b8dfa0;
      expv[18] = 48'hc6ee22b8dfa0;
      expv[19] = 48'hc1d18682d487;
      expv[20] = 48'hc3f85ec0fcc1;
      expv[21] = 48'hc3f85ec0fcc1;
      expv[22] = 48'ha1d18682d487;
      expv[23] = 48'ha3f85ec0fcc1;
      expv[24] = 48'hc9516b8e8f86;
      expv[25] = 48'had4a3a0909c5;
      expv[26] = 48'ha9516b8e8f86;
      expv[27] = 48'ha9516b8e8f86;
      expv[28] = 48'ha10c3e60adb2;
      expv[29] = 48'ha10c3e60adb2;
      expv[30] = 48'hc770107473e0;
      expv[31] = 48'hc770107473e0;
      expv[32] = 48'h5770107473e0;
      expv[33] = 48'h5770107473e0;
      expv[34] = 48'h5770107473e0;
      expv[35] = 48'h5770107473e0;
      expv[36] = 48'h5f0c4b74e1d2;
      expv[37] = 48'h5f0c4b74e1d2;
      expv[38] = 48'hc770107473e0;
      expv[39] = 48'haf0c4b74e1d2;
      expv[40] = 48'haf0c4b74e1d2;
      expv[41] = 48'haf0c4b74e1d2;
      expv[42] = 48'haf0c4b74e1d2;
      expv[43] = 48'haf0c4b74e1d2;
      expv[44] = 48'hc27433aca15f;
      expv[45] = 48'hc27433aca15f;
      expv[46] = 48'hc27433aca15f;
      expv[47] = 48'h527433aca15f;
      expv[48] = 48'h527433aca15f;
      expv[49] = 48'ha712f960dfcc;
      expv[50] = 48'ha3865336bff7;
      expv[51] = 48'ha3865336bff7;
      expv[52] = 48'ha27433aca15f;
      expv[53] = 48'ha27433aca15f;
      expv[54] = 48'ha27433aca15f;
      expv[55] = 48'hcb1d7ebd2bf5;
      expv[56] = 48'ha2011cbc0396;
      expv[57] = 48'ha2011cbc0396;
      expv[58] = 48'hc257073f50b5;
      expv[59] = 48'hab1d7ebd2bf5;
      expv[60] = 48'hc2c6b7ce5062;
      expv[61] = 48'h52c6b7ce5062;
      expv[62] = 48'h54d0c5a6fb83;
      expv[63] = 48'h54d0c5a6fb83;
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
