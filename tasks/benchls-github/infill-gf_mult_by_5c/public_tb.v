// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gf_mult_by_5c dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h34;
    stim[1] = 8'he1;
    stim[2] = 8'h20;
    stim[3] = 8'hb1;
    stim[4] = 8'hbe;
    stim[5] = 8'hd7;
    stim[6] = 8'hab;
    stim[7] = 8'hbb;
    stim[8] = 8'h35;
    stim[9] = 8'h7b;
    stim[10] = 8'hcf;
    stim[11] = 8'h09;
    stim[12] = 8'h02;
    stim[13] = 8'h8f;
    stim[14] = 8'h68;
    stim[15] = 8'h1a;
    stim[16] = 8'ha6;
    stim[17] = 8'hc3;
    stim[18] = 8'hab;
    stim[19] = 8'h78;
    stim[20] = 8'hbc;
    stim[21] = 8'hc7;
    stim[22] = 8'hd4;
    stim[23] = 8'h18;
    stim[24] = 8'hb2;
    stim[25] = 8'hc0;
    stim[26] = 8'hda;
    stim[27] = 8'h7b;
    stim[28] = 8'h2d;
    stim[29] = 8'hf2;
    stim[30] = 8'he8;
    stim[31] = 8'ha6;
    stim[32] = 8'h27;
    stim[33] = 8'hfd;
    stim[34] = 8'hfc;
    stim[35] = 8'haf;
    stim[36] = 8'hdf;
    stim[37] = 8'h8f;
    stim[38] = 8'hc5;
    stim[39] = 8'h27;
    stim[40] = 8'h7e;
    stim[41] = 8'h8f;
    stim[42] = 8'h5b;
    stim[43] = 8'hae;
    stim[44] = 8'h7f;
    stim[45] = 8'h79;
    stim[46] = 8'h28;
    stim[47] = 8'h6c;
    stim[48] = 8'h4a;
    stim[49] = 8'h4b;
    stim[50] = 8'h3c;
    stim[51] = 8'h28;
    stim[52] = 8'hd9;
    stim[53] = 8'hc1;
    stim[54] = 8'hef;
    stim[55] = 8'h0c;
    stim[56] = 8'h4c;
    stim[57] = 8'h63;
    stim[58] = 8'hff;
    stim[59] = 8'hf4;
    stim[60] = 8'he6;
    stim[61] = 8'h1b;
    stim[62] = 8'h5c;
    stim[63] = 8'hdd;
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
      expv[0] = 8'h8b;
      expv[1] = 8'hac;
      expv[2] = 8'h4f;
      expv[3] = 8'h9b;
      expv[4] = 8'hc8;
      expv[5] = 8'h9f;
      expv[6] = 8'h50;
      expv[7] = 8'hf9;
      expv[8] = 8'hd7;
      expv[9] = 8'h46;
      expv[10] = 8'hec;
      expv[11] = 8'h86;
      expv[12] = 8'hb8;
      expv[13] = 8'h72;
      expv[14] = 8'h0b;
      expv[15] = 8'hcb;
      expv[16] = 8'hbb;
      expv[17] = 8'h5b;
      expv[18] = 8'h50;
      expv[19] = 8'ha2;
      expv[20] = 8'h70;
      expv[21] = 8'h36;
      expv[22] = 8'h7b;
      expv[23] = 8'h73;
      expv[24] = 8'h7f;
      expv[25] = 8'hbf;
      expv[26] = 8'h74;
      expv[27] = 8'h46;
      expv[28] = 8'ha4;
      expv[29] = 8'he1;
      expv[30] = 8'h2a;
      expv[31] = 8'hbb;
      expv[32] = 8'hc6;
      expv[33] = 8'hb2;
      expv[34] = 8'hee;
      expv[35] = 8'h3d;
      expv[36] = 8'h45;
      expv[37] = 8'h72;
      expv[38] = 8'h8e;
      expv[39] = 8'hc6;
      expv[40] = 8'h77;
      expv[41] = 8'h72;
      expv[42] = 8'h09;
      expv[43] = 8'h61;
      expv[44] = 8'h2b;
      expv[45] = 8'hfe;
      expv[46] = 8'h95;
      expv[47] = 8'h66;
      expv[48] = 8'hfc;
      expv[49] = 8'ha0;
      expv[50] = 8'h51;
      expv[51] = 8'h95;
      expv[52] = 8'h90;
      expv[53] = 8'he3;
      expv[54] = 8'ha3;
      expv[55] = 8'hb7;
      expv[56] = 8'h29;
      expv[57] = 8'h35;
      expv[58] = 8'h0a;
      expv[59] = 8'h34;
      expv[60] = 8'h25;
      expv[61] = 8'h97;
      expv[62] = 8'h80;
      expv[63] = 8'hfd;
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
