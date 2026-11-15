// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_048822 dut (
    .InputA(in_vec[71:40]),
    .InputB(in_vec[39:8]),
    .ULAOPCode(in_vec[7:4]),
    .SRSignals(in_vec[3:0]),
    .Outp(out_vec[34:3]),
    .SRFlags(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'hb682015bc56ad2dead;
    stim[1] = 72'ha408236e9150006785;
    stim[2] = 72'hdb881289205081e24d;
    stim[3] = 72'h4f84baecde57bf934c;
    stim[4] = 72'hc8375acebf114e2ce6;
    stim[5] = 72'hb426ac90c15d31d966;
    stim[6] = 72'hc128b2682c3c00d0ff;
    stim[7] = 72'hb8cc98490b894b23eb;
    stim[8] = 72'hdf1d21dcb7899b4433;
    stim[9] = 72'h9dc90af57eef591288;
    stim[10] = 72'h87033c53bf6d3c9d94;
    stim[11] = 72'h4eac55b53d5ae66ec2;
    stim[12] = 72'hd4969a47f7f1ab100f;
    stim[13] = 72'h78eff5f3f056e43962;
    stim[14] = 72'hdce0495cea52a2af8f;
    stim[15] = 72'ha1005061b06ac30166;
    stim[16] = 72'heb7cd5a9a4587d04a6;
    stim[17] = 72'h91c19f4cfb61fe368c;
    stim[18] = 72'h2c0d74d5d052187625;
    stim[19] = 72'h4fd1dd5485711f2d79;
    stim[20] = 72'h1fd72e52fe57b25321;
    stim[21] = 72'h201fef3edd25a20666;
    stim[22] = 72'haeccba3d0e01701bda;
    stim[23] = 72'h70c487da80bcf32236;
    stim[24] = 72'h7b072eb1bc979221dd;
    stim[25] = 72'h6c4dbf4d6514a07aab;
    stim[26] = 72'h87391c0f7ea93d1c59;
    stim[27] = 72'hfff2062f0088f3a559;
    stim[28] = 72'h0bdc16a1c1fd2417c1;
    stim[29] = 72'ha047883469030a56cb;
    stim[30] = 72'h8ba2261dc66c99911a;
    stim[31] = 72'h402a454ee382a4eb41;
    stim[32] = 72'h40ab80fec6f63b4237;
    stim[33] = 72'h1344f12fcdacadf105;
    stim[34] = 72'h07f60baa13666430cd;
    stim[35] = 72'ha64c8fd0da6277e6f9;
    stim[36] = 72'hd4be2c6c111a938aaa;
    stim[37] = 72'h67680510452ffca9de;
    stim[38] = 72'h38b6ec47a0b1a3728b;
    stim[39] = 72'hd59c876f86732c343e;
    stim[40] = 72'h4bc46b5edcf27f029d;
    stim[41] = 72'h682c92716162cc509a;
    stim[42] = 72'hbe39798638ed541f3d;
    stim[43] = 72'he8c4bc7a6f9593e3d4;
    stim[44] = 72'h6013b3bcf7408d736b;
    stim[45] = 72'h00ac356014b50231fd;
    stim[46] = 72'h529ae914866312df08;
    stim[47] = 72'hc71b45b0a8a2ba2dab;
    stim[48] = 72'h62e2ddff495e87b934;
    stim[49] = 72'h76e1b6726835a8e86b;
    stim[50] = 72'h0c1ecdd3bdf7261b53;
    stim[51] = 72'h54b0be72d8580cf0f7;
    stim[52] = 72'h8fe523877c20463d5f;
    stim[53] = 72'hc27d4897c877261627;
    stim[54] = 72'he29f0876351dfcae77;
    stim[55] = 72'h40ae9eabb6ebc323fb;
    stim[56] = 72'hf893e30a67b5038881;
    stim[57] = 72'h5f5dad36adc8a96d9c;
    stim[58] = 72'hcd86336f3bc5398f8b;
    stim[59] = 72'h0412dc143f79133fe0;
    stim[60] = 72'h653f544e77dc01cc58;
    stim[61] = 72'h0c6e7ca3c0350eae33;
    stim[62] = 72'hea437a069264a039e5;
    stim[63] = 72'hc7a379e941ed99008e;
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
      expv[0] = 35'h000000000;
      expv[1] = 35'h2fd320a10;
      expv[2] = 35'h7dec49b59;
      expv[3] = 35'h48e982bf9;
      expv[4] = 35'h000000000;
      expv[5] = 35'h7abfdeec8;
      expv[6] = 35'h000000000;
      expv[7] = 35'h000000002;
      expv[8] = 35'h13c9c34c0;
      expv[9] = 35'h66d6791d1;
      expv[10] = 35'h000000008;
      expv[11] = 35'h000000002;
      expv[12] = 35'h664422ab8;
      expv[13] = 35'h7c7ffafd8;
      expv[14] = 35'h419b2ef20;
      expv[15] = 35'h58b569b08;
      expv[16] = 35'h000000000;
      expv[17] = 35'h5d5881041;
      expv[18] = 35'h1aa000000;
      expv[19] = 35'h000000002;
      expv[20] = 35'h394800000;
      expv[21] = 35'h7e9ff79f0;
      expv[22] = 35'h000000002;
      expv[23] = 35'h7803ca5c0;
      expv[24] = 35'h000000000;
      expv[25] = 35'h000000002;
      expv[26] = 35'h000000040;
      expv[27] = 35'h03ffc8188;
      expv[28] = 35'h000000002;
      expv[29] = 35'h000000002;
      expv[30] = 35'h411000088;
      expv[31] = 35'h51d470d29;
      expv[32] = 35'h3cdaa2de0;
      expv[33] = 35'h7078cf901;
      expv[34] = 35'h000000000;
      expv[35] = 35'h000000002;
      expv[36] = 35'h000000002;
      expv[37] = 35'h000000000;
      expv[38] = 35'h3b7eb64f0;
      expv[39] = 35'h2794ad9d8;
      expv[40] = 35'h7fffffff1;
      expv[41] = 35'h000000008;
      expv[42] = 35'h42a612b39;
      expv[43] = 35'h000000000;
      expv[44] = 35'h7ba9dfff8;
      expv[45] = 35'h000000000;
      expv[46] = 35'h6c7efdf99;
      expv[47] = 35'h000000002;
      expv[48] = 35'h0cc22b230;
      expv[49] = 35'h3f7adf7d0;
      expv[50] = 35'h000000008;
      expv[51] = 35'h000000000;
      expv[52] = 35'h000000020;
      expv[53] = 35'h12e000000;
      expv[54] = 35'h000000000;
      expv[55] = 35'h000000002;
      expv[56] = 35'h2b25dda80;
      expv[57] = 35'h7fffffff9;
      expv[58] = 35'h6c6ab9008;
      expv[59] = 35'h000000002;
      expv[60] = 35'h000329fa8;
      expv[61] = 35'h261cb6fa8;
      expv[62] = 35'h000000000;
      expv[63] = 35'h5cc8a0800;
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
