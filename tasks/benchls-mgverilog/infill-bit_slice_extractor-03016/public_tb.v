// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03016 dut (
    .x(in_vec[15:0]),
    .y(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hc570;
    stim[1] = 16'h9729;
    stim[2] = 16'hdb08;
    stim[3] = 16'h6916;
    stim[4] = 16'h1e22;
    stim[5] = 16'h1006;
    stim[6] = 16'hd04f;
    stim[7] = 16'hcdf3;
    stim[8] = 16'h2d05;
    stim[9] = 16'h8e42;
    stim[10] = 16'h29d4;
    stim[11] = 16'h98dc;
    stim[12] = 16'h4872;
    stim[13] = 16'h0f55;
    stim[14] = 16'h8c84;
    stim[15] = 16'h6aa1;
    stim[16] = 16'he42f;
    stim[17] = 16'h09ad;
    stim[18] = 16'he709;
    stim[19] = 16'hd698;
    stim[20] = 16'hac79;
    stim[21] = 16'h7540;
    stim[22] = 16'h8511;
    stim[23] = 16'h26d2;
    stim[24] = 16'hfe1b;
    stim[25] = 16'h5d9d;
    stim[26] = 16'h4a9c;
    stim[27] = 16'h3559;
    stim[28] = 16'hd278;
    stim[29] = 16'h35b5;
    stim[30] = 16'h0274;
    stim[31] = 16'h899a;
    stim[32] = 16'h9ca6;
    stim[33] = 16'h0997;
    stim[34] = 16'he1af;
    stim[35] = 16'h5fcb;
    stim[36] = 16'h5465;
    stim[37] = 16'h0435;
    stim[38] = 16'h6e63;
    stim[39] = 16'h148a;
    stim[40] = 16'h4bef;
    stim[41] = 16'hb8b4;
    stim[42] = 16'h4cd2;
    stim[43] = 16'hdeb8;
    stim[44] = 16'h586e;
    stim[45] = 16'h5dcd;
    stim[46] = 16'hf833;
    stim[47] = 16'h7809;
    stim[48] = 16'hab15;
    stim[49] = 16'ha831;
    stim[50] = 16'hc501;
    stim[51] = 16'h5848;
    stim[52] = 16'h91cc;
    stim[53] = 16'hf64c;
    stim[54] = 16'hb883;
    stim[55] = 16'h44be;
    stim[56] = 16'h5d06;
    stim[57] = 16'hfe61;
    stim[58] = 16'h25d2;
    stim[59] = 16'h8179;
    stim[60] = 16'hcee1;
    stim[61] = 16'h9146;
    stim[62] = 16'hf2b4;
    stim[63] = 16'h8619;
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
      expv[0] = 8'hb8;
      expv[1] = 8'h94;
      expv[2] = 8'h84;
      expv[3] = 8'h8b;
      expv[4] = 8'h11;
      expv[5] = 8'h03;
      expv[6] = 8'h27;
      expv[7] = 8'hf9;
      expv[8] = 8'h82;
      expv[9] = 8'h21;
      expv[10] = 8'hea;
      expv[11] = 8'h6e;
      expv[12] = 8'h39;
      expv[13] = 8'haa;
      expv[14] = 8'h42;
      expv[15] = 8'h50;
      expv[16] = 8'h17;
      expv[17] = 8'hd6;
      expv[18] = 8'h84;
      expv[19] = 8'h4c;
      expv[20] = 8'h3c;
      expv[21] = 8'ha0;
      expv[22] = 8'h88;
      expv[23] = 8'h69;
      expv[24] = 8'h0d;
      expv[25] = 8'hce;
      expv[26] = 8'h4e;
      expv[27] = 8'hac;
      expv[28] = 8'h3c;
      expv[29] = 8'hda;
      expv[30] = 8'h3a;
      expv[31] = 8'hcd;
      expv[32] = 8'h53;
      expv[33] = 8'hcb;
      expv[34] = 8'hd7;
      expv[35] = 8'he5;
      expv[36] = 8'h32;
      expv[37] = 8'h1a;
      expv[38] = 8'h31;
      expv[39] = 8'h45;
      expv[40] = 8'hf7;
      expv[41] = 8'h5a;
      expv[42] = 8'h69;
      expv[43] = 8'h5c;
      expv[44] = 8'h37;
      expv[45] = 8'he6;
      expv[46] = 8'h19;
      expv[47] = 8'h04;
      expv[48] = 8'h8a;
      expv[49] = 8'h18;
      expv[50] = 8'h80;
      expv[51] = 8'h24;
      expv[52] = 8'he6;
      expv[53] = 8'h26;
      expv[54] = 8'h41;
      expv[55] = 8'h5f;
      expv[56] = 8'h83;
      expv[57] = 8'h30;
      expv[58] = 8'he9;
      expv[59] = 8'hbc;
      expv[60] = 8'h70;
      expv[61] = 8'ha3;
      expv[62] = 8'h5a;
      expv[63] = 8'h0c;
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
