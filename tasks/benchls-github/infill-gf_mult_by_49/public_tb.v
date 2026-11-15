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

  gf_mult_by_49 dut (
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
    stim[0] = 8'he7;
    stim[1] = 8'hba;
    stim[2] = 8'h0f;
    stim[3] = 8'h35;
    stim[4] = 8'h88;
    stim[5] = 8'hec;
    stim[6] = 8'h91;
    stim[7] = 8'h96;
    stim[8] = 8'h30;
    stim[9] = 8'h06;
    stim[10] = 8'h7e;
    stim[11] = 8'he9;
    stim[12] = 8'h46;
    stim[13] = 8'h2b;
    stim[14] = 8'h77;
    stim[15] = 8'h7a;
    stim[16] = 8'h02;
    stim[17] = 8'h70;
    stim[18] = 8'h5d;
    stim[19] = 8'hf9;
    stim[20] = 8'hbb;
    stim[21] = 8'h05;
    stim[22] = 8'h94;
    stim[23] = 8'hdf;
    stim[24] = 8'h23;
    stim[25] = 8'hfc;
    stim[26] = 8'h54;
    stim[27] = 8'hfe;
    stim[28] = 8'h7a;
    stim[29] = 8'h72;
    stim[30] = 8'ha0;
    stim[31] = 8'hc1;
    stim[32] = 8'h3b;
    stim[33] = 8'hef;
    stim[34] = 8'h33;
    stim[35] = 8'hbf;
    stim[36] = 8'h65;
    stim[37] = 8'h4f;
    stim[38] = 8'h38;
    stim[39] = 8'h44;
    stim[40] = 8'h32;
    stim[41] = 8'h68;
    stim[42] = 8'he4;
    stim[43] = 8'h71;
    stim[44] = 8'h45;
    stim[45] = 8'h78;
    stim[46] = 8'h62;
    stim[47] = 8'hf8;
    stim[48] = 8'h23;
    stim[49] = 8'h87;
    stim[50] = 8'h5a;
    stim[51] = 8'hcd;
    stim[52] = 8'hc9;
    stim[53] = 8'h6e;
    stim[54] = 8'h1a;
    stim[55] = 8'h21;
    stim[56] = 8'hde;
    stim[57] = 8'h3b;
    stim[58] = 8'hc8;
    stim[59] = 8'h18;
    stim[60] = 8'hfb;
    stim[61] = 8'h11;
    stim[62] = 8'hb0;
    stim[63] = 8'h58;
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
      expv[1] = 8'ha2;
      expv[2] = 8'h90;
      expv[3] = 8'h41;
      expv[4] = 8'h01;
      expv[5] = 8'h5a;
      expv[6] = 8'hde;
      expv[7] = 8'h3c;
      expv[8] = 8'h31;
      expv[9] = 8'hab;
      expv[10] = 8'h5f;
      expv[11] = 8'h2a;
      expv[12] = 8'h1c;
      expv[13] = 8'h7c;
      expv[14] = 8'h64;
      expv[15] = 8'h66;
      expv[16] = 8'h92;
      expv[17] = 8'h86;
      expv[18] = 8'h51;
      expv[19] = 8'hce;
      expv[20] = 8'heb;
      expv[21] = 8'h70;
      expv[22] = 8'hae;
      expv[23] = 8'hb0;
      expv[24] = 8'h0e;
      expv[25] = 8'hbe;
      expv[26] = 8'h6a;
      expv[27] = 8'h2c;
      expv[28] = 8'h66;
      expv[29] = 8'h14;
      expv[30] = 8'ha6;
      expv[31] = 8'h8d;
      expv[32] = 8'h98;
      expv[33] = 8'h81;
      expv[34] = 8'hea;
      expv[35] = 8'hd2;
      expv[36] = 8'h12;
      expv[37] = 8'h27;
      expv[38] = 8'h43;
      expv[39] = 8'h8e;
      expv[40] = 8'ha3;
      expv[41] = 8'h10;
      expv[42] = 8'h28;
      expv[43] = 8'hcf;
      expv[44] = 8'hc7;
      expv[45] = 8'hf4;
      expv[46] = 8'hf0;
      expv[47] = 8'h87;
      expv[48] = 8'h0e;
      expv[49] = 8'h91;
      expv[50] = 8'hb3;
      expv[51] = 8'hc6;
      expv[52] = 8'hff;
      expv[53] = 8'hbb;
      expv[54] = 8'h04;
      expv[55] = 8'h9c;
      expv[56] = 8'hf9;
      expv[57] = 8'h98;
      expv[58] = 8'hb6;
      expv[59] = 8'h96;
      expv[60] = 8'h5c;
      expv[61] = 8'had;
      expv[62] = 8'h42;
      expv[63] = 8'h21;
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
