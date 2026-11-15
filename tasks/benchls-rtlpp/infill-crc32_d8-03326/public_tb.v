// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03326 dut (
    .CLK(clk),
    .DATA_IN(in_vec[42:35]),
    .RESET(in_vec[34:34]),
    .START(in_vec[33:33]),
    .LOAD(in_vec[32:32]),
    .CRC_IN(in_vec[31:0]),
    .CRC_OUT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h28e9e20c919;
    stim[1] = 43'h0e52eb71681;
    stim[2] = 43'h5134082d083;
    stim[3] = 43'h5610b80b7e4;
    stim[4] = 43'h2a1d2658248;
    stim[5] = 43'h411443fe601;
    stim[6] = 43'h50e4f643bdf;
    stim[7] = 43'h23bb440a211;
    stim[8] = 43'h483a4a8b089;
    stim[9] = 43'h118eb7a8484;
    stim[10] = 43'h30269c22b53;
    stim[11] = 43'h73b69331ee6;
    stim[12] = 43'h761b87398ec;
    stim[13] = 43'h5ca27806733;
    stim[14] = 43'h40913216151;
    stim[15] = 43'h2894692a2eb;
    stim[16] = 43'h281c0c88b48;
    stim[17] = 43'h41b39ed5973;
    stim[18] = 43'h3a2d30df400;
    stim[19] = 43'h5e179673f03;
    stim[20] = 43'h073bd82550f;
    stim[21] = 43'h1c02ca997f6;
    stim[22] = 43'h6a03056b547;
    stim[23] = 43'h0a1ff9c5cc0;
    stim[24] = 43'h08a5e1ad2ba;
    stim[25] = 43'h4624cc9bd75;
    stim[26] = 43'h6a8c2508e44;
    stim[27] = 43'h15b0c72fb25;
    stim[28] = 43'h0011fe740d9;
    stim[29] = 43'h36058ab858a;
    stim[30] = 43'h4b189377f39;
    stim[31] = 43'h3c206fbc776;
    stim[32] = 43'h3abebcae16f;
    stim[33] = 43'h77933d2afd7;
    stim[34] = 43'h2b2c348d6a6;
    stim[35] = 43'h262f0a0b9f3;
    stim[36] = 43'h1c128174998;
    stim[37] = 43'h400806a8e59;
    stim[38] = 43'h2c8e3454170;
    stim[39] = 43'h521ef8bdc36;
    stim[40] = 43'h6e1cae799ee;
    stim[41] = 43'h300294518af;
    stim[42] = 43'h3e92189c5c1;
    stim[43] = 43'h5da03e0311b;
    stim[44] = 43'h19aad101734;
    stim[45] = 43'h0224370d51d;
    stim[46] = 43'h2b2463b50f1;
    stim[47] = 43'h1db361c3db6;
    stim[48] = 43'h519b6e76be0;
    stim[49] = 43'h009c1d29f3c;
    stim[50] = 43'h358548931f0;
    stim[51] = 43'h3c93090b842;
    stim[52] = 43'h37b28895e81;
    stim[53] = 43'h5a24c7fc2ed;
    stim[54] = 43'h5a17a9af51d;
    stim[55] = 43'h396e60ede9b;
    stim[56] = 43'h450b57a9406;
    stim[57] = 43'h17134263163;
    stim[58] = 43'h2dab283cc1e;
    stim[59] = 43'h3886918b425;
    stim[60] = 43'h6bbd3d43386;
    stim[61] = 43'h1e1cab6d243;
    stim[62] = 43'h5221852e305;
    stim[63] = 43'h5803d83612c;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hf8ad6d60;
      expv[4] = 32'h0b80b7e4;
      expv[5] = 32'hd2658248;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h2ac12072;
      expv[9] = 32'h539429a8;
      expv[10] = 32'h539429a8;
      expv[11] = 32'h4d58e349;
      expv[12] = 32'h8646c9d8;
      expv[13] = 32'hb87398ec;
      expv[14] = 32'h7759f1b7;
      expv[15] = 32'h13216151;
      expv[16] = 32'h4692a2eb;
      expv[17] = 32'hc0c88b48;
      expv[18] = 32'hf14e1eae;
      expv[19] = 32'h30d72585;
      expv[20] = 32'h79673f03;
      expv[21] = 32'h99cc4ee2;
      expv[22] = 32'h99cc4ee2;
      expv[23] = 32'h99cc4ee2;
      expv[24] = 32'hff9c5cc0;
      expv[25] = 32'h657b4673;
      expv[26] = 32'h9c26a576;
      expv[27] = 32'h9c26a576;
      expv[28] = 32'h85dcab7b;
      expv[29] = 32'h1fe740d9;
      expv[30] = 32'h1fe740d9;
      expv[31] = 32'h89377f39;
      expv[32] = 32'hba06d9be;
      expv[33] = 32'h631c9324;
      expv[34] = 32'h33d2afd7;
      expv[35] = 32'h69cf7afc;
      expv[36] = 32'h409c218b;
      expv[37] = 32'h28174998;
      expv[38] = 32'h28174998;
      expv[39] = 32'h28174998;
      expv[40] = 32'hef8bdc36;
      expv[41] = 32'hcae799ee;
      expv[42] = 32'hcae799ee;
      expv[43] = 32'h2189c5c1;
      expv[44] = 32'h83522c48;
      expv[45] = 32'hef12c57e;
      expv[46] = 32'hfc279318;
      expv[47] = 32'hf93698d8;
      expv[48] = 32'h629073f7;
      expv[49] = 32'hb6e76be0;
      expv[50] = 32'hc1d29f3c;
      expv[51] = 32'hc1d29f3c;
      expv[52] = 32'h3090b842;
      expv[53] = 32'hd06054ba;
      expv[54] = 32'hdff50a4b;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h34263163;
      expv[59] = 32'hb2db182a;
      expv[60] = 32'hb2db182a;
      expv[61] = 32'h607887fc;
      expv[62] = 32'hcab6d243;
      expv[63] = 32'h26f9259d;
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
