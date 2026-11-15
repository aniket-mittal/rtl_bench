// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04702 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h0fabcd69;
    stim[1] = 31'h32c1975c;
    stim[2] = 31'h52624a2a;
    stim[3] = 31'h7e71635c;
    stim[4] = 31'h4b03d2f4;
    stim[5] = 31'h6588001f;
    stim[6] = 31'h6c5ff72b;
    stim[7] = 31'h48d968a3;
    stim[8] = 31'h70148498;
    stim[9] = 31'h595166d6;
    stim[10] = 31'h7c32761f;
    stim[11] = 31'h510a6706;
    stim[12] = 31'h40f51f5c;
    stim[13] = 31'h711872e0;
    stim[14] = 31'h665af793;
    stim[15] = 31'h7649909d;
    stim[16] = 31'h7f7a9c7c;
    stim[17] = 31'h71e983a1;
    stim[18] = 31'h6e794ca6;
    stim[19] = 31'h644daaf5;
    stim[20] = 31'h62c5c5ff;
    stim[21] = 31'h41d30d03;
    stim[22] = 31'h6fcb2044;
    stim[23] = 31'h5f417dbf;
    stim[24] = 31'h660cd857;
    stim[25] = 31'h56691125;
    stim[26] = 31'h2247656f;
    stim[27] = 31'h57a7c812;
    stim[28] = 31'h5c0c8eda;
    stim[29] = 31'h4e623cf2;
    stim[30] = 31'h796fbd20;
    stim[31] = 31'h5247327d;
    stim[32] = 31'h5912315e;
    stim[33] = 31'h7137b21f;
    stim[34] = 31'h7ac88806;
    stim[35] = 31'h68cfa9ec;
    stim[36] = 31'h58be6503;
    stim[37] = 31'h6e9d1c77;
    stim[38] = 31'h5c9c7174;
    stim[39] = 31'h684c0d28;
    stim[40] = 31'h4d55c806;
    stim[41] = 31'h4a4d6c4b;
    stim[42] = 31'h60f30905;
    stim[43] = 31'h5f679e7f;
    stim[44] = 31'h73f5471b;
    stim[45] = 31'h6a68df94;
    stim[46] = 31'h7d8aff8d;
    stim[47] = 31'h21d80418;
    stim[48] = 31'h58ed8f9f;
    stim[49] = 31'h5b1ffc3e;
    stim[50] = 31'h42901fcf;
    stim[51] = 31'h419bf03f;
    stim[52] = 31'h4ea8fa34;
    stim[53] = 31'h5a2fb8c4;
    stim[54] = 31'h4806ab05;
    stim[55] = 31'h5285eed2;
    stim[56] = 31'h6cb4a00d;
    stim[57] = 31'h444bb15c;
    stim[58] = 31'h6c0286de;
    stim[59] = 31'h64547a17;
    stim[60] = 31'h71a82d4f;
    stim[61] = 31'h5955994e;
    stim[62] = 31'h506d9a23;
    stim[63] = 31'h56f86633;
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
      expv[0] = 36'hxxxxxxxxe;
      expv[1] = 36'hxxxxxxxxe;
      expv[2] = 36'hxxxxxxxxe;
      expv[3] = 36'hxxxxxxxx4;
      expv[4] = 36'h000001266;
      expv[5] = 36'h000001263;
      expv[6] = 36'h000003bde;
      expv[7] = 36'h00000015c;
      expv[8] = 36'h000000151;
      expv[9] = 36'h000001693;
      expv[10] = 36'h000001699;
      expv[11] = 36'h000003ff4;
      expv[12] = 36'h000003ff4;
      expv[13] = 36'h000003ff3;
      expv[14] = 36'h000002e3b;
      expv[15] = 36'h000003f4c;
      expv[16] = 36'h0000005a6;
      expv[17] = 36'h000001bee;
      expv[18] = 36'h000003b6c;
      expv[19] = 36'h000000d59;
      expv[20] = 36'h000001bc9;
      expv[21] = 36'h000002011;
      expv[22] = 36'h000002016;
      expv[23] = 36'h0000024be;
      expv[24] = 36'h0000024bc;
      expv[25] = 36'h0000053b4;
      expv[26] = 36'h0000053b3;
      expv[27] = 36'h0000053bc;
      expv[28] = 36'h0000053b4;
      expv[29] = 36'h0000053b3;
      expv[30] = 36'h0000053bc;
      expv[31] = 36'h000004214;
      expv[32] = 36'h00000421b;
      expv[33] = 36'h00000421c;
      expv[34] = 36'h0000046d4;
      expv[35] = 36'h000001816;
      expv[36] = 36'h0000032dc;
      expv[37] = 36'h0000032d9;
      expv[38] = 36'h000005463;
      expv[39] = 36'h00000546b;
      expv[40] = 36'h000003fac;
      expv[41] = 36'h000003fa9;
      expv[42] = 36'h000003fa9;
      expv[43] = 36'h000001f93;
      expv[44] = 36'h000001f9e;
      expv[45] = 36'h000003ff9;
      expv[46] = 36'h0000013e6;
      expv[47] = 36'h000001e43;
      expv[48] = 36'h000001e4c;
      expv[49] = 36'h000001e46;
      expv[50] = 36'h000001e46;
      expv[51] = 36'h000001e46;
      expv[52] = 36'h000001e4b;
      expv[53] = 36'h000001e49;
      expv[54] = 36'h000001e41;
      expv[55] = 36'h000001e46;
      expv[56] = 36'h000001e4b;
      expv[57] = 36'h000007b9e;
      expv[58] = 36'h000007b9c;
      expv[59] = 36'h000000c99;
      expv[60] = 36'h0000018a4;
      expv[61] = 36'h000001cfb;
      expv[62] = 36'h000001cfc;
      expv[63] = 36'h000001cf4;
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
