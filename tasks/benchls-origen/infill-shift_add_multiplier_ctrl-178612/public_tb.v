// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_178612 dut (
    .clk(clk),
    .GO(in_vec[6:6]),
    .GT(in_vec[5:5]),
    .N(in_vec[4:1]),
    .rst(in_vec[0:0]),
    .LOADCNT(out_vec[6:6]),
    .ENCNT(out_vec[5:5]),
    .MUXPROD(out_vec[4:4]),
    .LOADPROD(out_vec[3:3]),
    .MUXOUT(out_vec[2:2]),
    .DONE(out_vec[1:1]),
    .ERROR(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h1d;
    stim[1] = 7'h55;
    stim[2] = 7'h28;
    stim[3] = 7'h30;
    stim[4] = 7'h70;
    stim[5] = 7'h4e;
    stim[6] = 7'h3e;
    stim[7] = 7'h3a;
    stim[8] = 7'h52;
    stim[9] = 7'h52;
    stim[10] = 7'h44;
    stim[11] = 7'h30;
    stim[12] = 7'h6a;
    stim[13] = 7'h42;
    stim[14] = 7'h4a;
    stim[15] = 7'h72;
    stim[16] = 7'h40;
    stim[17] = 7'h6c;
    stim[18] = 7'h22;
    stim[19] = 7'h6a;
    stim[20] = 7'h00;
    stim[21] = 7'h1e;
    stim[22] = 7'h76;
    stim[23] = 7'h3c;
    stim[24] = 7'h5a;
    stim[25] = 7'h6e;
    stim[26] = 7'h48;
    stim[27] = 7'h7a;
    stim[28] = 7'h20;
    stim[29] = 7'h2c;
    stim[30] = 7'h5e;
    stim[31] = 7'h76;
    stim[32] = 7'h6e;
    stim[33] = 7'h36;
    stim[34] = 7'h78;
    stim[35] = 7'h6c;
    stim[36] = 7'h0a;
    stim[37] = 7'h50;
    stim[38] = 7'h10;
    stim[39] = 7'h22;
    stim[40] = 7'h34;
    stim[41] = 7'h2a;
    stim[42] = 7'h14;
    stim[43] = 7'h2a;
    stim[44] = 7'h6a;
    stim[45] = 7'h04;
    stim[46] = 7'h74;
    stim[47] = 7'h42;
    stim[48] = 7'h78;
    stim[49] = 7'h68;
    stim[50] = 7'h00;
    stim[51] = 7'h52;
    stim[52] = 7'h08;
    stim[53] = 7'h18;
    stim[54] = 7'h4a;
    stim[55] = 7'h5a;
    stim[56] = 7'h2e;
    stim[57] = 7'h48;
    stim[58] = 7'h6a;
    stim[59] = 7'h00;
    stim[60] = 7'h48;
    stim[61] = 7'h0e;
    stim[62] = 7'h44;
    stim[63] = 7'h00;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 7'h0x;
      expv[1] = 7'h4x;
      expv[2] = 7'h0x;
      expv[3] = 7'h0x;
      expv[4] = 7'h4x;
      expv[5] = 7'h4x;
      expv[6] = 7'h2x;
      expv[7] = 7'h0x;
      expv[8] = 7'h4x;
      expv[9] = 7'h4x;
      expv[10] = 7'h4x;
      expv[11] = 7'h2x;
      expv[12] = 7'h1x;
      expv[13] = 7'h1x;
      expv[14] = 7'h1x;
      expv[15] = 7'h0x;
      expv[16] = 7'h06;
      expv[17] = 7'h42;
      expv[18] = 7'h22;
      expv[19] = 7'h12;
      expv[20] = 7'h12;
      expv[21] = 7'h12;
      expv[22] = 7'h0b;
      expv[23] = 7'h06;
      expv[24] = 7'h43;
      expv[25] = 7'h23;
      expv[26] = 7'h12;
      expv[27] = 7'h0a;
      expv[28] = 7'h07;
      expv[29] = 7'h02;
      expv[30] = 7'h42;
      expv[31] = 7'h23;
      expv[32] = 7'h12;
      expv[33] = 7'h0a;
      expv[34] = 7'h06;
      expv[35] = 7'h42;
      expv[36] = 7'h42;
      expv[37] = 7'h42;
      expv[38] = 7'h42;
      expv[39] = 7'h22;
      expv[40] = 7'h12;
      expv[41] = 7'h0a;
      expv[42] = 7'h06;
      expv[43] = 7'h02;
      expv[44] = 7'h42;
      expv[45] = 7'h42;
      expv[46] = 7'h22;
      expv[47] = 7'h12;
      expv[48] = 7'h0a;
      expv[49] = 7'h06;
      expv[50] = 7'h02;
      expv[51] = 7'h42;
      expv[52] = 7'h42;
      expv[53] = 7'h42;
      expv[54] = 7'h42;
      expv[55] = 7'h42;
      expv[56] = 7'h23;
      expv[57] = 7'h12;
      expv[58] = 7'h0a;
      expv[59] = 7'h06;
      expv[60] = 7'h42;
      expv[61] = 7'h42;
      expv[62] = 7'h42;
      expv[63] = 7'h42;
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
