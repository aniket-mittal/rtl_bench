// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_033371 dut (
    .data1(in_vec[34:19]),
    .data2(in_vec[18:3]),
    .ALU_control_input(in_vec[2:0]),
    .result(out_vec[31:16]),
    .status_reg(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h54d674591;
    stim[1] = 35'h2a00ab28a;
    stim[2] = 35'h1cde3d973;
    stim[3] = 35'h55dcde8f5;
    stim[4] = 35'h22d441b00;
    stim[5] = 35'h3b788a0c4;
    stim[6] = 35'h655b1efb0;
    stim[7] = 35'h453bf4e0d;
    stim[8] = 35'h7f8b83ba3;
    stim[9] = 35'h6a50b6b67;
    stim[10] = 35'h3f8b2874b;
    stim[11] = 35'h69084a1a8;
    stim[12] = 35'h3d90965fd;
    stim[13] = 35'h0256afdb5;
    stim[14] = 35'h01aeef25f;
    stim[15] = 35'h22c9e062c;
    stim[16] = 35'h41ada5c46;
    stim[17] = 35'h3a6cce041;
    stim[18] = 35'h3dbdc12eb;
    stim[19] = 35'h5be1c5829;
    stim[20] = 35'h5fcb66ae4;
    stim[21] = 35'h70e25cb0d;
    stim[22] = 35'h60c7ce8de;
    stim[23] = 35'h6220cf27a;
    stim[24] = 35'h1cf49c900;
    stim[25] = 35'h011083063;
    stim[26] = 35'h1d895775a;
    stim[27] = 35'h32ca4ecaa;
    stim[28] = 35'h230eca3f9;
    stim[29] = 35'h181805fb1;
    stim[30] = 35'h7073ffcb2;
    stim[31] = 35'h611f15c7f;
    stim[32] = 35'h2ed98f0f2;
    stim[33] = 35'h627a676a0;
    stim[34] = 35'h34cd72265;
    stim[35] = 35'h1b4ee92cb;
    stim[36] = 35'h4ce061bb6;
    stim[37] = 35'h2051dc711;
    stim[38] = 35'h1e4f43f30;
    stim[39] = 35'h0ba98554b;
    stim[40] = 35'h05003bf85;
    stim[41] = 35'h2d4a30002;
    stim[42] = 35'h2f475c98e;
    stim[43] = 35'h43baa1728;
    stim[44] = 35'h5e8098e68;
    stim[45] = 35'h4e4bcc652;
    stim[46] = 35'h42b7d815b;
    stim[47] = 35'h7ef02fe4c;
    stim[48] = 35'h2510b848d;
    stim[49] = 35'h5f0d8f787;
    stim[50] = 35'h6935b5031;
    stim[51] = 35'h537138c1d;
    stim[52] = 35'h19028ff8a;
    stim[53] = 35'h1ed64fe9a;
    stim[54] = 35'h5ebf5b8e7;
    stim[55] = 35'h7ab0b8881;
    stim[56] = 35'h728f567de;
    stim[57] = 35'h3f19c9d3c;
    stim[58] = 35'h0621ed5a1;
    stim[59] = 35'h7591b45e1;
    stim[60] = 35'h7b7f7c9a2;
    stim[61] = 35'h6439da447;
    stim[62] = 35'h4a3cbb9c9;
    stim[63] = 35'h4a01da059;
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
      expv[0] = 32'h925e5000;
      expv[1] = 32'hfdb07000;
      expv[2] = 32'hb4ea6000;
      expv[3] = 32'ha9184000;
      expv[4] = 32'hc9084000;
      expv[5] = 32'hfa987000;
      expv[6] = 32'h08ac1000;
      expv[7] = 32'h88414000;
      expv[8] = 32'h068b1000;
      expv[9] = 32'h6d6c0000;
      expv[10] = 32'hcfff6000;
      expv[11] = 32'h66453000;
      expv[12] = 32'h28210000;
      expv[13] = 32'h04a40000;
      expv[14] = 32'hde4b4000;
      expv[15] = 32'hca1f7000;
      expv[16] = 32'h5b003000;
      expv[17] = 32'h10e11000;
      expv[18] = 32'hfdd84000;
      expv[19] = 32'h42c83000;
      expv[20] = 32'hf7e87000;
      expv[21] = 32'ha1404000;
      expv[22] = 32'h78003000;
      expv[23] = 32'h25f22000;
      expv[24] = 32'h73090000;
      expv[25] = 32'h082d0000;
      expv[26] = 32'h8c275000;
      expv[27] = 32'hc7ff5000;
      expv[28] = 32'hda9c4000;
      expv[29] = 32'h3c260000;
      expv[30] = 32'he1515000;
      expv[31] = 32'h2b8f0000;
      expv[32] = 32'h3f950000;
      expv[33] = 32'h93c85000;
      expv[34] = 32'h60080000;
      expv[35] = 32'h08f61000;
      expv[36] = 32'h70003000;
      expv[37] = 32'hf9854000;
      expv[38] = 32'hc4844000;
      expv[39] = 32'h21fc0000;
      expv[40] = 32'h02000000;
      expv[41] = 32'hfa947000;
      expv[42] = 32'hbd1c4000;
      expv[43] = 32'hca5a4000;
      expv[44] = 32'heece4000;
      expv[45] = 32'h03cd2000;
      expv[46] = 32'h359a3000;
      expv[47] = 32'h74e03000;
      expv[48] = 32'h40010000;
      expv[49] = 32'h1ef00000;
      expv[50] = 32'h3c711000;
      expv[51] = 32'h20820000;
      expv[52] = 32'h12140000;
      expv[53] = 32'h9dd95000;
      expv[54] = 32'hb71c4000;
      expv[55] = 32'h66711000;
      expv[56] = 32'hf0007000;
      expv[57] = 32'h9c457000;
      expv[58] = 32'he6f74000;
      expv[59] = 32'h53df1000;
      expv[60] = 32'hfdca5000;
      expv[61] = 32'hb4884000;
      expv[62] = 32'h0bb21000;
      expv[63] = 32'h480e3000;
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
