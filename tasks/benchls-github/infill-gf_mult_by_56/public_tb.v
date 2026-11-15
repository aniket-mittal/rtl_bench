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

  gf_mult_by_56 dut (
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
    stim[0] = 8'hc2;
    stim[1] = 8'h88;
    stim[2] = 8'hf0;
    stim[3] = 8'hde;
    stim[4] = 8'hed;
    stim[5] = 8'h67;
    stim[6] = 8'h5d;
    stim[7] = 8'h9a;
    stim[8] = 8'h64;
    stim[9] = 8'h2f;
    stim[10] = 8'h06;
    stim[11] = 8'h93;
    stim[12] = 8'h73;
    stim[13] = 8'hbb;
    stim[14] = 8'hb3;
    stim[15] = 8'h17;
    stim[16] = 8'h60;
    stim[17] = 8'h6f;
    stim[18] = 8'ha2;
    stim[19] = 8'h43;
    stim[20] = 8'h70;
    stim[21] = 8'hbd;
    stim[22] = 8'hcb;
    stim[23] = 8'hea;
    stim[24] = 8'h06;
    stim[25] = 8'h6a;
    stim[26] = 8'h77;
    stim[27] = 8'h85;
    stim[28] = 8'h7c;
    stim[29] = 8'h52;
    stim[30] = 8'h0b;
    stim[31] = 8'h3a;
    stim[32] = 8'h0b;
    stim[33] = 8'h11;
    stim[34] = 8'hb8;
    stim[35] = 8'hb1;
    stim[36] = 8'hff;
    stim[37] = 8'h89;
    stim[38] = 8'h4d;
    stim[39] = 8'h08;
    stim[40] = 8'h4f;
    stim[41] = 8'h55;
    stim[42] = 8'h7b;
    stim[43] = 8'h86;
    stim[44] = 8'h6a;
    stim[45] = 8'h06;
    stim[46] = 8'ha1;
    stim[47] = 8'hd2;
    stim[48] = 8'h01;
    stim[49] = 8'hc5;
    stim[50] = 8'hdd;
    stim[51] = 8'h08;
    stim[52] = 8'h3e;
    stim[53] = 8'hc2;
    stim[54] = 8'ha4;
    stim[55] = 8'h2d;
    stim[56] = 8'h2a;
    stim[57] = 8'hf0;
    stim[58] = 8'h6c;
    stim[59] = 8'h88;
    stim[60] = 8'hd9;
    stim[61] = 8'h69;
    stim[62] = 8'h9b;
    stim[63] = 8'h1b;
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
      expv[1] = 8'hc2;
      expv[2] = 8'h77;
      expv[3] = 8'h06;
      expv[4] = 8'he7;
      expv[5] = 8'h89;
      expv[6] = 8'hb4;
      expv[7] = 8'h67;
      expv[8] = 8'h73;
      expv[9] = 8'h27;
      expv[10] = 8'he9;
      expv[11] = 8'hbb;
      expv[12] = 8'hc5;
      expv[13] = 8'h23;
      expv[14] = 8'ha9;
      expv[15] = 8'hb6;
      expv[16] = 8'h36;
      expv[17] = 8'h03;
      expv[18] = 8'hf6;
      expv[19] = 8'hde;
      expv[20] = 8'h3f;
      expv[21] = 8'hca;
      expv[22] = 8'h1c;
      expv[23] = 8'h58;
      expv[24] = 8'he9;
      expv[25] = 8'h10;
      expv[26] = 8'h80;
      expv[27] = 8'h5b;
      expv[28] = 8'hf0;
      expv[29] = 8'h81;
      expv[30] = 8'h70;
      expv[31] = 8'h3d;
      expv[32] = 8'h70;
      expv[33] = 8'h5f;
      expv[34] = 8'hd9;
      expv[35] = 8'h05;
      expv[36] = 8'h42;
      expv[37] = 8'h94;
      expv[38] = 8'hbd;
      expv[39] = 8'h8a;
      expv[40] = 8'h11;
      expv[41] = 8'h3e;
      expv[42] = 8'h4f;
      expv[43] = 8'ha1;
      expv[44] = 8'h10;
      expv[45] = 8'he9;
      expv[46] = 8'h0c;
      expv[47] = 8'hc9;
      expv[48] = 8'h56;
      expv[49] = 8'h7f;
      expv[50] = 8'hfc;
      expv[51] = 8'h8a;
      expv[52] = 8'h78;
      expv[53] = 8'hc0;
      expv[54] = 8'h1f;
      expv[55] = 8'h8b;
      expv[56] = 8'h34;
      expv[57] = 8'h77;
      expv[58] = 8'hf9;
      expv[59] = 8'hc2;
      expv[60] = 8'hb9;
      expv[61] = 8'hea;
      expv[62] = 8'h31;
      expv[63] = 8'h79;
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
