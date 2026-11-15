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

  gf_mult_by_1a dut (
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
    stim[0] = 8'h31;
    stim[1] = 8'h66;
    stim[2] = 8'h15;
    stim[3] = 8'h6d;
    stim[4] = 8'h18;
    stim[5] = 8'hea;
    stim[6] = 8'hcc;
    stim[7] = 8'h91;
    stim[8] = 8'h4f;
    stim[9] = 8'h36;
    stim[10] = 8'h32;
    stim[11] = 8'h7a;
    stim[12] = 8'hec;
    stim[13] = 8'ha7;
    stim[14] = 8'hc3;
    stim[15] = 8'h92;
    stim[16] = 8'hb2;
    stim[17] = 8'hfd;
    stim[18] = 8'h71;
    stim[19] = 8'h35;
    stim[20] = 8'h53;
    stim[21] = 8'hee;
    stim[22] = 8'h90;
    stim[23] = 8'hec;
    stim[24] = 8'h93;
    stim[25] = 8'h6c;
    stim[26] = 8'h51;
    stim[27] = 8'h6a;
    stim[28] = 8'hf6;
    stim[29] = 8'hef;
    stim[30] = 8'h94;
    stim[31] = 8'hd3;
    stim[32] = 8'hd2;
    stim[33] = 8'ha0;
    stim[34] = 8'hc6;
    stim[35] = 8'hd6;
    stim[36] = 8'h31;
    stim[37] = 8'ha8;
    stim[38] = 8'h9e;
    stim[39] = 8'h70;
    stim[40] = 8'h16;
    stim[41] = 8'hff;
    stim[42] = 8'h95;
    stim[43] = 8'hfe;
    stim[44] = 8'h6f;
    stim[45] = 8'h6d;
    stim[46] = 8'hb7;
    stim[47] = 8'haa;
    stim[48] = 8'h35;
    stim[49] = 8'h3b;
    stim[50] = 8'h57;
    stim[51] = 8'hc3;
    stim[52] = 8'h71;
    stim[53] = 8'h86;
    stim[54] = 8'hfb;
    stim[55] = 8'h3b;
    stim[56] = 8'h58;
    stim[57] = 8'hc0;
    stim[58] = 8'h6a;
    stim[59] = 8'hf9;
    stim[60] = 8'hab;
    stim[61] = 8'h71;
    stim[62] = 8'h67;
    stim[63] = 8'h5b;
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
      expv[0] = 8'hc0;
      expv[1] = 8'hf5;
      expv[2] = 8'hcf;
      expv[3] = 8'h0b;
      expv[4] = 8'h6d;
      expv[5] = 8'hcc;
      expv[6] = 8'hf7;
      expv[7] = 8'h26;
      expv[8] = 8'h58;
      expv[9] = 8'h86;
      expv[10] = 8'hee;
      expv[11] = 8'hf0;
      expv[12] = 8'h90;
      expv[13] = 8'ha0;
      expv[14] = 8'h61;
      expv[15] = 8'h08;
      expv[16] = 8'h6f;
      expv[17] = 8'h37;
      expv[18] = 8'h0e;
      expv[19] = 8'ha8;
      expv[20] = 8'h5d;
      expv[21] = 8'ha4;
      expv[22] = 8'h3c;
      expv[23] = 8'h90;
      expv[24] = 8'h12;
      expv[25] = 8'h11;
      expv[26] = 8'h69;
      expv[27] = 8'h4d;
      expv[28] = 8'hc9;
      expv[29] = 8'hbe;
      expv[30] = 8'h54;
      expv[31] = 8'hdc;
      expv[32] = 8'hc6;
      expv[33] = 8'he6;
      expv[34] = 8'h13;
      expv[35] = 8'hae;
      expv[36] = 8'hc0;
      expv[37] = 8'h36;
      expv[38] = 8'hb0;
      expv[39] = 8'h14;
      expv[40] = 8'he1;
      expv[41] = 8'h03;
      expv[42] = 8'h4e;
      expv[43] = 8'h19;
      expv[44] = 8'h3f;
      expv[45] = 8'h0b;
      expv[46] = 8'h1d;
      expv[47] = 8'h02;
      expv[48] = 8'ha8;
      expv[49] = 8'h24;
      expv[50] = 8'h35;
      expv[51] = 8'h61;
      expv[52] = 8'h0e;
      expv[53] = 8'hdd;
      expv[54] = 8'h6b;
      expv[55] = 8'h24;
      expv[56] = 8'ha3;
      expv[57] = 8'h4f;
      expv[58] = 8'h4d;
      expv[59] = 8'h5f;
      expv[60] = 8'h18;
      expv[61] = 8'h0e;
      expv[62] = 8'hef;
      expv[63] = 8'h8d;
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
