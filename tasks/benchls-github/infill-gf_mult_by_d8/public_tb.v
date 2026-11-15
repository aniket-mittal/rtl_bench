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

  gf_mult_by_d8 dut (
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
    stim[0] = 8'h81;
    stim[1] = 8'h72;
    stim[2] = 8'h0b;
    stim[3] = 8'h03;
    stim[4] = 8'hba;
    stim[5] = 8'hfc;
    stim[6] = 8'ha0;
    stim[7] = 8'hb2;
    stim[8] = 8'h9e;
    stim[9] = 8'hc6;
    stim[10] = 8'h88;
    stim[11] = 8'hc9;
    stim[12] = 8'h6c;
    stim[13] = 8'hef;
    stim[14] = 8'h17;
    stim[15] = 8'hb8;
    stim[16] = 8'h1a;
    stim[17] = 8'hae;
    stim[18] = 8'h0a;
    stim[19] = 8'hfa;
    stim[20] = 8'h49;
    stim[21] = 8'hce;
    stim[22] = 8'h6b;
    stim[23] = 8'h5f;
    stim[24] = 8'h5f;
    stim[25] = 8'he5;
    stim[26] = 8'hf7;
    stim[27] = 8'h69;
    stim[28] = 8'h64;
    stim[29] = 8'hbd;
    stim[30] = 8'hdb;
    stim[31] = 8'h07;
    stim[32] = 8'hd9;
    stim[33] = 8'hd1;
    stim[34] = 8'hc7;
    stim[35] = 8'h8d;
    stim[36] = 8'h56;
    stim[37] = 8'h97;
    stim[38] = 8'h7b;
    stim[39] = 8'h93;
    stim[40] = 8'hf7;
    stim[41] = 8'h06;
    stim[42] = 8'h7c;
    stim[43] = 8'h0e;
    stim[44] = 8'hf4;
    stim[45] = 8'h2c;
    stim[46] = 8'he9;
    stim[47] = 8'hb2;
    stim[48] = 8'hb1;
    stim[49] = 8'h5a;
    stim[50] = 8'h13;
    stim[51] = 8'h03;
    stim[52] = 8'hcf;
    stim[53] = 8'ha7;
    stim[54] = 8'h6d;
    stim[55] = 8'ha4;
    stim[56] = 8'h54;
    stim[57] = 8'h7b;
    stim[58] = 8'hb6;
    stim[59] = 8'he2;
    stim[60] = 8'h6e;
    stim[61] = 8'hfc;
    stim[62] = 8'h51;
    stim[63] = 8'hbb;
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
      expv[0] = 8'hd0;
      expv[1] = 8'haa;
      expv[2] = 8'hfb;
      expv[3] = 8'h75;
      expv[4] = 8'h28;
      expv[5] = 8'hc6;
      expv[6] = 8'h0a;
      expv[7] = 8'ha6;
      expv[8] = 8'h6d;
      expv[9] = 8'he6;
      expv[10] = 8'h86;
      expv[11] = 8'h5a;
      expv[12] = 8'hcf;
      expv[13] = 8'hb2;
      expv[14] = 8'h33;
      expv[15] = 8'h85;
      expv[16] = 8'h22;
      expv[17] = 8'h6e;
      expv[18] = 8'h23;
      expv[19] = 8'h2c;
      expv[20] = 8'h52;
      expv[21] = 8'h68;
      expv[22] = 8'hfd;
      expv[23] = 8'hb9;
      expv[24] = 8'hb9;
      expv[25] = 8'h91;
      expv[26] = 8'h3d;
      expv[27] = 8'h50;
      expv[28] = 8'h41;
      expv[29] = 8'h1a;
      expv[30] = 8'hf6;
      expv[31] = 8'h32;
      expv[32] = 8'h5b;
      expv[33] = 8'hd5;
      expv[34] = 8'h3e;
      expv[35] = 8'h19;
      expv[36] = 8'hef;
      expv[37] = 8'h3b;
      expv[38] = 8'hfc;
      expv[39] = 8'h7c;
      expv[40] = 8'h3d;
      expv[41] = 8'hea;
      expv[42] = 8'hce;
      expv[43] = 8'h64;
      expv[44] = 8'h48;
      expv[45] = 8'hcb;
      expv[46] = 8'h58;
      expv[47] = 8'ha6;
      expv[48] = 8'hd3;
      expv[49] = 8'h26;
      expv[50] = 8'h74;
      expv[51] = 8'h75;
      expv[52] = 8'hb0;
      expv[53] = 8'h38;
      expv[54] = 8'h17;
      expv[55] = 8'h4d;
      expv[56] = 8'h42;
      expv[57] = 8'hfc;
      expv[58] = 8'he1;
      expv[59] = 8'ha3;
      expv[60] = 8'h62;
      expv[61] = 8'hc6;
      expv[62] = 8'hdd;
      expv[63] = 8'hf0;
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
