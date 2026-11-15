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

  gf_mult_by_78 dut (
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
    stim[0] = 8'h72;
    stim[1] = 8'hb0;
    stim[2] = 8'h9f;
    stim[3] = 8'hc6;
    stim[4] = 8'h54;
    stim[5] = 8'hcf;
    stim[6] = 8'h49;
    stim[7] = 8'h35;
    stim[8] = 8'h18;
    stim[9] = 8'hc2;
    stim[10] = 8'hdf;
    stim[11] = 8'hcf;
    stim[12] = 8'hd8;
    stim[13] = 8'hb3;
    stim[14] = 8'h92;
    stim[15] = 8'h3d;
    stim[16] = 8'heb;
    stim[17] = 8'h6f;
    stim[18] = 8'h2f;
    stim[19] = 8'h7f;
    stim[20] = 8'h5f;
    stim[21] = 8'h6b;
    stim[22] = 8'h6d;
    stim[23] = 8'ha9;
    stim[24] = 8'h69;
    stim[25] = 8'hcb;
    stim[26] = 8'h99;
    stim[27] = 8'h9b;
    stim[28] = 8'h4f;
    stim[29] = 8'hf6;
    stim[30] = 8'h93;
    stim[31] = 8'h72;
    stim[32] = 8'h57;
    stim[33] = 8'hd5;
    stim[34] = 8'hd3;
    stim[35] = 8'haf;
    stim[36] = 8'hb2;
    stim[37] = 8'h58;
    stim[38] = 8'h95;
    stim[39] = 8'h61;
    stim[40] = 8'ha2;
    stim[41] = 8'ha3;
    stim[42] = 8'h67;
    stim[43] = 8'h4b;
    stim[44] = 8'h4a;
    stim[45] = 8'h21;
    stim[46] = 8'hb5;
    stim[47] = 8'h46;
    stim[48] = 8'h7f;
    stim[49] = 8'h79;
    stim[50] = 8'h18;
    stim[51] = 8'h8f;
    stim[52] = 8'hc7;
    stim[53] = 8'h0e;
    stim[54] = 8'h6e;
    stim[55] = 8'ha2;
    stim[56] = 8'hde;
    stim[57] = 8'h99;
    stim[58] = 8'h02;
    stim[59] = 8'h12;
    stim[60] = 8'h49;
    stim[61] = 8'h1f;
    stim[62] = 8'hf9;
    stim[63] = 8'hf6;
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
      expv[0] = 8'hf3;
      expv[1] = 8'hbe;
      expv[2] = 8'h97;
      expv[3] = 8'hb0;
      expv[4] = 8'h45;
      expv[5] = 8'h2f;
      expv[6] = 8'hf4;
      expv[7] = 8'hed;
      expv[8] = 8'h34;
      expv[9] = 8'h4d;
      expv[10] = 8'hfc;
      expv[11] = 8'h2f;
      expv[12] = 8'h89;
      expv[13] = 8'h36;
      expv[14] = 8'hf5;
      expv[15] = 8'h0a;
      expv[16] = 8'h69;
      expv[17] = 8'h42;
      expv[18] = 8'h29;
      expv[19] = 8'h91;
      expv[20] = 8'h2a;
      expv[21] = 8'hbf;
      expv[22] = 8'hb2;
      expv[23] = 8'hf2;
      expv[24] = 8'h4f;
      expv[25] = 8'hd2;
      expv[26] = 8'h9a;
      expv[27] = 8'h6a;
      expv[28] = 8'hf9;
      expv[29] = 8'hd8;
      expv[30] = 8'h8d;
      expv[31] = 8'hf3;
      expv[32] = 8'hcd;
      expv[33] = 8'heb;
      expv[34] = 8'he6;
      expv[35] = 8'hff;
      expv[36] = 8'h4e;
      expv[37] = 8'h5f;
      expv[38] = 8'h80;
      expv[39] = 8'ha8;
      expv[40] = 8'h9d;
      expv[41] = 8'he5;
      expv[42] = 8'ha5;
      expv[43] = 8'h04;
      expv[44] = 8'h7c;
      expv[45] = 8'hc3;
      expv[46] = 8'h3b;
      expv[47] = 8'h66;
      expv[48] = 8'h91;
      expv[49] = 8'h9c;
      expv[50] = 8'h34;
      expv[51] = 8'h44;
      expv[52] = 8'hc8;
      expv[53] = 8'hea;
      expv[54] = 8'h3a;
      expv[55] = 8'h9d;
      expv[56] = 8'h84;
      expv[57] = 8'h9a;
      expv[58] = 8'hf0;
      expv[59] = 8'h23;
      expv[60] = 8'hf4;
      expv[61] = 8'h41;
      expv[62] = 8'h4a;
      expv[63] = 8'hd8;
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
