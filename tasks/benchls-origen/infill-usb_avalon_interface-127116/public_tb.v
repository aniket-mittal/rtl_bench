// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_127116 dut (
    .clk(clk),
    .reset(in_vec[22:22]),
    .address(in_vec[21:14]),
    .writedata(in_vec[13:6]),
    .write(in_vec[5:5]),
    .read(in_vec[4:4]),
    .chipselect(in_vec[3:3]),
    .usbClk(in_vec[2:2]),
    .USBWireVPI(in_vec[1:1]),
    .USBWireVMI(in_vec[0:0]),
    .readdata(out_vec[14:7]),
    .waitrequest(out_vec[6:6]),
    .irq(out_vec[5:5]),
    .USBWireVPO(out_vec[4:4]),
    .USBWireVMO(out_vec[3:3]),
    .USBWireDataOutTick(out_vec[2:2]),
    .USBWireOutEn_n(out_vec[1:1]),
    .USBFullSpeed(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h6c1730;
    stim[1] = 23'h5b890a;
    stim[2] = 23'h017c4b;
    stim[3] = 23'h18eb8a;
    stim[4] = 23'h176ad3;
    stim[5] = 23'h34bfb9;
    stim[6] = 23'h380455;
    stim[7] = 23'h7c6a2f;
    stim[8] = 23'h211188;
    stim[9] = 23'h1a63ee;
    stim[10] = 23'h3add76;
    stim[11] = 23'h1a4b30;
    stim[12] = 23'h2af8a9;
    stim[13] = 23'h7d5d53;
    stim[14] = 23'h2aafad;
    stim[15] = 23'h3c68fc;
    stim[16] = 23'h07a69c;
    stim[17] = 23'h1f9668;
    stim[18] = 23'h30fa30;
    stim[19] = 23'h2e684b;
    stim[20] = 23'h14f723;
    stim[21] = 23'h1b9f5b;
    stim[22] = 23'h36bc7b;
    stim[23] = 23'h392a80;
    stim[24] = 23'h3dba2b;
    stim[25] = 23'h21824a;
    stim[26] = 23'h2e4a72;
    stim[27] = 23'h130697;
    stim[28] = 23'h129ff5;
    stim[29] = 23'h246c8b;
    stim[30] = 23'h346cc3;
    stim[31] = 23'h285b72;
    stim[32] = 23'h17d0dc;
    stim[33] = 23'h37cb79;
    stim[34] = 23'h1d9d61;
    stim[35] = 23'h03fe01;
    stim[36] = 23'h0bc32b;
    stim[37] = 23'h79fa30;
    stim[38] = 23'h042950;
    stim[39] = 23'h169923;
    stim[40] = 23'h3b5581;
    stim[41] = 23'h00785a;
    stim[42] = 23'h225074;
    stim[43] = 23'h3359f2;
    stim[44] = 23'h2e53e9;
    stim[45] = 23'h1956d9;
    stim[46] = 23'h113db0;
    stim[47] = 23'h3d6a0a;
    stim[48] = 23'h1d92fa;
    stim[49] = 23'h1af0b9;
    stim[50] = 23'h0f8763;
    stim[51] = 23'h3b6748;
    stim[52] = 23'h2b45a1;
    stim[53] = 23'h310179;
    stim[54] = 23'h029164;
    stim[55] = 23'h11c2b7;
    stim[56] = 23'h3032e0;
    stim[57] = 23'h035486;
    stim[58] = 23'h10935a;
    stim[59] = 23'h32263d;
    stim[60] = 23'h099fb2;
    stim[61] = 23'h14d571;
    stim[62] = 23'h242c46;
    stim[63] = 23'h4c4899;
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
      expv[0] = 15'h0003;
      expv[1] = 15'h0003;
      expv[2] = 15'h000b;
      expv[3] = 15'h0003;
      expv[4] = 15'h000b;
      expv[5] = 15'h000b;
      expv[6] = 15'h004f;
      expv[7] = 15'h000f;
      expv[8] = 15'h0003;
      expv[9] = 15'h0007;
      expv[10] = 15'h0047;
      expv[11] = 15'h0043;
      expv[12] = 15'h004b;
      expv[13] = 15'h000b;
      expv[14] = 15'h000f;
      expv[15] = 15'h0047;
      expv[16] = 15'h0047;
      expv[17] = 15'h0043;
      expv[18] = 15'h0043;
      expv[19] = 15'h004b;
      expv[20] = 15'h004b;
      expv[21] = 15'h004b;
      expv[22] = 15'h004b;
      expv[23] = 15'h0043;
      expv[24] = 15'h004b;
      expv[25] = 15'h0043;
      expv[26] = 15'h0043;
      expv[27] = 15'h004f;
      expv[28] = 15'h004f;
      expv[29] = 15'h004b;
      expv[30] = 15'h004b;
      expv[31] = 15'h0043;
      expv[32] = 15'h0047;
      expv[33] = 15'h004b;
      expv[34] = 15'h004b;
      expv[35] = 15'h004b;
      expv[36] = 15'h004b;
      expv[37] = 15'h0003;
      expv[38] = 15'h0003;
      expv[39] = 15'h000b;
      expv[40] = 15'h000b;
      expv[41] = 15'h0003;
      expv[42] = 15'h0047;
      expv[43] = 15'h0043;
      expv[44] = 15'h004b;
      expv[45] = 15'h004b;
      expv[46] = 15'h0043;
      expv[47] = 15'h0043;
      expv[48] = 15'h0043;
      expv[49] = 15'h004b;
      expv[50] = 15'h004b;
      expv[51] = 15'h0043;
      expv[52] = 15'h004b;
      expv[53] = 15'h004b;
      expv[54] = 15'h0047;
      expv[55] = 15'h004f;
      expv[56] = 15'h0043;
      expv[57] = 15'h0047;
      expv[58] = 15'h0043;
      expv[59] = 15'h004f;
      expv[60] = 15'h0043;
      expv[61] = 15'h004b;
      expv[62] = 15'h0047;
      expv[63] = 15'h000b;
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
