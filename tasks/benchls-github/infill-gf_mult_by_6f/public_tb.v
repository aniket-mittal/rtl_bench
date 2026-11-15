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

  gf_mult_by_6f dut (
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
    stim[0] = 8'hfe;
    stim[1] = 8'h40;
    stim[2] = 8'h4c;
    stim[3] = 8'h8c;
    stim[4] = 8'h76;
    stim[5] = 8'ha1;
    stim[6] = 8'h0d;
    stim[7] = 8'h14;
    stim[8] = 8'hcc;
    stim[9] = 8'hce;
    stim[10] = 8'hbc;
    stim[11] = 8'h09;
    stim[12] = 8'h0f;
    stim[13] = 8'h38;
    stim[14] = 8'h6b;
    stim[15] = 8'h32;
    stim[16] = 8'hc3;
    stim[17] = 8'hb5;
    stim[18] = 8'h6a;
    stim[19] = 8'h7a;
    stim[20] = 8'h15;
    stim[21] = 8'h7c;
    stim[22] = 8'h77;
    stim[23] = 8'h46;
    stim[24] = 8'h59;
    stim[25] = 8'ha6;
    stim[26] = 8'h73;
    stim[27] = 8'h1e;
    stim[28] = 8'h0c;
    stim[29] = 8'h36;
    stim[30] = 8'hc5;
    stim[31] = 8'hb5;
    stim[32] = 8'h18;
    stim[33] = 8'ha8;
    stim[34] = 8'h10;
    stim[35] = 8'hb5;
    stim[36] = 8'h51;
    stim[37] = 8'h75;
    stim[38] = 8'h1d;
    stim[39] = 8'h00;
    stim[40] = 8'h06;
    stim[41] = 8'hb3;
    stim[42] = 8'hca;
    stim[43] = 8'hef;
    stim[44] = 8'he9;
    stim[45] = 8'hb8;
    stim[46] = 8'hba;
    stim[47] = 8'hec;
    stim[48] = 8'h4a;
    stim[49] = 8'h77;
    stim[50] = 8'h80;
    stim[51] = 8'h88;
    stim[52] = 8'hb0;
    stim[53] = 8'h16;
    stim[54] = 8'hc7;
    stim[55] = 8'hb2;
    stim[56] = 8'heb;
    stim[57] = 8'h53;
    stim[58] = 8'h25;
    stim[59] = 8'h89;
    stim[60] = 8'h65;
    stim[61] = 8'h6e;
    stim[62] = 8'h96;
    stim[63] = 8'hb4;
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
      expv[0] = 8'ha4;
      expv[1] = 8'hc2;
      expv[2] = 8'h3c;
      expv[3] = 8'h67;
      expv[4] = 8'h62;
      expv[5] = 8'h97;
      expv[6] = 8'h91;
      expv[7] = 8'h1f;
      expv[8] = 8'ha5;
      expv[9] = 8'h7b;
      expv[10] = 8'hb8;
      expv[11] = 8'h30;
      expv[12] = 8'h4f;
      expv[13] = 8'h80;
      expv[14] = 8'h4d;
      expv[15] = 8'h01;
      expv[16] = 8'hea;
      expv[17] = 8'h88;
      expv[18] = 8'h22;
      expv[19] = 8'h9c;
      expv[20] = 8'h70;
      expv[21] = 8'he3;
      expv[22] = 8'h0d;
      expv[23] = 8'hbd;
      expv[24] = 8'h4c;
      expv[25] = 8'h87;
      expv[26] = 8'hac;
      expv[27] = 8'h9e;
      expv[28] = 8'hfe;
      expv[29] = 8'ha0;
      expv[30] = 8'h95;
      expv[31] = 8'h88;
      expv[32] = 8'he1;
      expv[33] = 8'ha7;
      expv[34] = 8'hbe;
      expv[35] = 8'h88;
      expv[36] = 8'h13;
      expv[37] = 8'hd3;
      expv[38] = 8'h2f;
      expv[39] = 8'h00;
      expv[40] = 8'h7f;
      expv[41] = 8'hf7;
      expv[42] = 8'hda;
      expv[43] = 8'h75;
      expv[44] = 8'h0a;
      expv[45] = 8'h19;
      expv[46] = 8'hc7;
      expv[47] = 8'hc4;
      expv[48] = 8'h43;
      expv[49] = 8'h0d;
      expv[50] = 8'h99;
      expv[51] = 8'hc6;
      expv[52] = 8'h46;
      expv[53] = 8'hc1;
      expv[54] = 8'h4b;
      expv[55] = 8'h98;
      expv[56] = 8'hd4;
      expv[57] = 8'hcd;
      expv[58] = 8'haf;
      expv[59] = 8'ha9;
      expv[60] = 8'h6d;
      expv[61] = 8'h83;
      expv[62] = 8'h58;
      expv[63] = 8'he7;
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
