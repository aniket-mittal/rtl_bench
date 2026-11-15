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

  mg_04536 dut (
    .data_0(in_vec[7:7]),
    .data_1(in_vec[6:6]),
    .data_2(in_vec[5:5]),
    .data_3(in_vec[4:4]),
    .data_4(in_vec[3:3]),
    .data_5(in_vec[2:2]),
    .data_6(in_vec[1:1]),
    .data_7(in_vec[0:0]),
    .ccat_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h9e;
    stim[1] = 8'h99;
    stim[2] = 8'ha4;
    stim[3] = 8'h28;
    stim[4] = 8'h9e;
    stim[5] = 8'h0d;
    stim[6] = 8'h7a;
    stim[7] = 8'hc2;
    stim[8] = 8'h40;
    stim[9] = 8'h8e;
    stim[10] = 8'hdc;
    stim[11] = 8'h20;
    stim[12] = 8'h30;
    stim[13] = 8'h5b;
    stim[14] = 8'h55;
    stim[15] = 8'h91;
    stim[16] = 8'hbe;
    stim[17] = 8'h6a;
    stim[18] = 8'h9d;
    stim[19] = 8'h97;
    stim[20] = 8'h89;
    stim[21] = 8'h60;
    stim[22] = 8'hfe;
    stim[23] = 8'h06;
    stim[24] = 8'h88;
    stim[25] = 8'h1c;
    stim[26] = 8'hb3;
    stim[27] = 8'hb4;
    stim[28] = 8'h1a;
    stim[29] = 8'h5e;
    stim[30] = 8'h04;
    stim[31] = 8'hab;
    stim[32] = 8'hf1;
    stim[33] = 8'hce;
    stim[34] = 8'h5a;
    stim[35] = 8'h3c;
    stim[36] = 8'hf2;
    stim[37] = 8'h50;
    stim[38] = 8'h67;
    stim[39] = 8'he3;
    stim[40] = 8'h07;
    stim[41] = 8'h1c;
    stim[42] = 8'h74;
    stim[43] = 8'ha6;
    stim[44] = 8'hef;
    stim[45] = 8'h6a;
    stim[46] = 8'h1a;
    stim[47] = 8'h1c;
    stim[48] = 8'h6c;
    stim[49] = 8'h72;
    stim[50] = 8'he1;
    stim[51] = 8'ha1;
    stim[52] = 8'hd5;
    stim[53] = 8'h69;
    stim[54] = 8'h9b;
    stim[55] = 8'h55;
    stim[56] = 8'h85;
    stim[57] = 8'h6c;
    stim[58] = 8'h5a;
    stim[59] = 8'hb3;
    stim[60] = 8'hda;
    stim[61] = 8'h47;
    stim[62] = 8'h87;
    stim[63] = 8'h13;
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
      expv[0] = 8'h79;
      expv[1] = 8'h99;
      expv[2] = 8'h25;
      expv[3] = 8'h14;
      expv[4] = 8'h79;
      expv[5] = 8'hb0;
      expv[6] = 8'h5e;
      expv[7] = 8'h43;
      expv[8] = 8'h02;
      expv[9] = 8'h71;
      expv[10] = 8'h3b;
      expv[11] = 8'h04;
      expv[12] = 8'h0c;
      expv[13] = 8'hda;
      expv[14] = 8'haa;
      expv[15] = 8'h89;
      expv[16] = 8'h7d;
      expv[17] = 8'h56;
      expv[18] = 8'hb9;
      expv[19] = 8'he9;
      expv[20] = 8'h91;
      expv[21] = 8'h06;
      expv[22] = 8'h7f;
      expv[23] = 8'h60;
      expv[24] = 8'h11;
      expv[25] = 8'h38;
      expv[26] = 8'hcd;
      expv[27] = 8'h2d;
      expv[28] = 8'h58;
      expv[29] = 8'h7a;
      expv[30] = 8'h20;
      expv[31] = 8'hd5;
      expv[32] = 8'h8f;
      expv[33] = 8'h73;
      expv[34] = 8'h5a;
      expv[35] = 8'h3c;
      expv[36] = 8'h4f;
      expv[37] = 8'h0a;
      expv[38] = 8'he6;
      expv[39] = 8'hc7;
      expv[40] = 8'he0;
      expv[41] = 8'h38;
      expv[42] = 8'h2e;
      expv[43] = 8'h65;
      expv[44] = 8'hf7;
      expv[45] = 8'h56;
      expv[46] = 8'h58;
      expv[47] = 8'h38;
      expv[48] = 8'h36;
      expv[49] = 8'h4e;
      expv[50] = 8'h87;
      expv[51] = 8'h85;
      expv[52] = 8'hab;
      expv[53] = 8'h96;
      expv[54] = 8'hd9;
      expv[55] = 8'haa;
      expv[56] = 8'ha1;
      expv[57] = 8'h36;
      expv[58] = 8'h5a;
      expv[59] = 8'hcd;
      expv[60] = 8'h5b;
      expv[61] = 8'he2;
      expv[62] = 8'he1;
      expv[63] = 8'hc8;
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
