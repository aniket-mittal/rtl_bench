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

  gf_mult_by_aa dut (
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
    stim[0] = 8'h2a;
    stim[1] = 8'h2e;
    stim[2] = 8'h40;
    stim[3] = 8'h85;
    stim[4] = 8'h4c;
    stim[5] = 8'h90;
    stim[6] = 8'h9d;
    stim[7] = 8'hcd;
    stim[8] = 8'heb;
    stim[9] = 8'h5b;
    stim[10] = 8'hec;
    stim[11] = 8'h1e;
    stim[12] = 8'h0c;
    stim[13] = 8'hda;
    stim[14] = 8'ha6;
    stim[15] = 8'hd7;
    stim[16] = 8'h72;
    stim[17] = 8'h84;
    stim[18] = 8'he8;
    stim[19] = 8'hc9;
    stim[20] = 8'h58;
    stim[21] = 8'hd4;
    stim[22] = 8'hf8;
    stim[23] = 8'h99;
    stim[24] = 8'h81;
    stim[25] = 8'h17;
    stim[26] = 8'hb7;
    stim[27] = 8'h7e;
    stim[28] = 8'hb4;
    stim[29] = 8'h48;
    stim[30] = 8'hc5;
    stim[31] = 8'h5a;
    stim[32] = 8'h79;
    stim[33] = 8'hbd;
    stim[34] = 8'h04;
    stim[35] = 8'ha1;
    stim[36] = 8'h42;
    stim[37] = 8'h91;
    stim[38] = 8'h40;
    stim[39] = 8'h25;
    stim[40] = 8'h17;
    stim[41] = 8'hc8;
    stim[42] = 8'ha9;
    stim[43] = 8'h93;
    stim[44] = 8'h43;
    stim[45] = 8'hf6;
    stim[46] = 8'hd7;
    stim[47] = 8'h6f;
    stim[48] = 8'h27;
    stim[49] = 8'h76;
    stim[50] = 8'h47;
    stim[51] = 8'h0f;
    stim[52] = 8'h51;
    stim[53] = 8'heb;
    stim[54] = 8'hd3;
    stim[55] = 8'h75;
    stim[56] = 8'h84;
    stim[57] = 8'h44;
    stim[58] = 8'h85;
    stim[59] = 8'hd4;
    stim[60] = 8'h40;
    stim[61] = 8'h79;
    stim[62] = 8'h04;
    stim[63] = 8'h24;
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
      expv[0] = 8'h94;
      expv[1] = 8'h06;
      expv[2] = 8'hd5;
      expv[3] = 8'h8f;
      expv[4] = 8'h7e;
      expv[5] = 8'hc5;
      expv[6] = 8'hc4;
      expv[7] = 8'h63;
      expv[8] = 8'h5c;
      expv[9] = 8'h7d;
      expv[10] = 8'h2d;
      expv[11] = 8'h90;
      expv[12] = 8'hab;
      expv[13] = 8'h60;
      expv[14] = 8'h88;
      expv[15] = 8'h61;
      expv[16] = 8'h0a;
      expv[17] = 8'h25;
      expv[18] = 8'hbf;
      expv[19] = 8'hf1;
      expv[20] = 8'h9e;
      expv[21] = 8'h82;
      expv[22] = 8'hcd;
      expv[23] = 8'h56;
      expv[24] = 8'h1d;
      expv[25] = 8'h03;
      expv[26] = 8'h50;
      expv[27] = 8'ha1;
      expv[28] = 8'hb3;
      expv[29] = 8'hec;
      expv[30] = 8'h5a;
      expv[31] = 8'hd7;
      expv[32] = 8'hd0;
      expv[33] = 8'h20;
      expv[34] = 8'h92;
      expv[35] = 8'hf9;
      expv[36] = 8'h9c;
      expv[37] = 8'h6f;
      expv[38] = 8'hd5;
      expv[39] = 8'hdc;
      expv[40] = 8'h03;
      expv[41] = 8'h5b;
      expv[42] = 8'hc0;
      expv[43] = 8'h26;
      expv[44] = 8'h36;
      expv[45] = 8'h2f;
      expv[46] = 8'h61;
      expv[47] = 8'h79;
      expv[48] = 8'h95;
      expv[49] = 8'h98;
      expv[50] = 8'ha4;
      expv[51] = 8'h48;
      expv[52] = 8'h0d;
      expv[53] = 8'h5c;
      expv[54] = 8'hf3;
      expv[55] = 8'h7b;
      expv[56] = 8'h25;
      expv[57] = 8'h47;
      expv[58] = 8'h8f;
      expv[59] = 8'h82;
      expv[60] = 8'hd5;
      expv[61] = 8'hd0;
      expv[62] = 8'h92;
      expv[63] = 8'h76;
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
