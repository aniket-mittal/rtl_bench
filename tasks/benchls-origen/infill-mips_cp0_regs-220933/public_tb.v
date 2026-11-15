// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 80;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_220933 dut (
    .clk(clk),
    .rst(in_vec[79:79]),
    .mfc0(in_vec[78:78]),
    .mtc0(in_vec[77:77]),
    .pc(in_vec[76:45]),
    .Rd(in_vec[44:40]),
    .wdata(in_vec[39:8]),
    .exception(in_vec[7:7]),
    .eret(in_vec[6:6]),
    .cause(in_vec[5:1]),
    .intr(in_vec[0:0]),
    .rdata(out_vec[96:65]),
    .status(out_vec[64:33]),
    .timer_int(out_vec[32:32]),
    .exc_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 80'h90563c2ba428248617af;
    stim[1] = 80'hfad6e725b944dd12971f;
    stim[2] = 80'h6c2757a68a3ce02c74a7;
    stim[3] = 80'h0e90c29333bc50d18afe;
    stim[4] = 80'h1ed9d947230821827b87;
    stim[5] = 80'h3fd32fd13f709c4872c4;
    stim[6] = 80'h489a651ac2a71168370b;
    stim[7] = 80'h6090c026b2254bd34d25;
    stim[8] = 80'h5296c194906321ef3737;
    stim[9] = 80'h0abd59538900d9a9c5c1;
    stim[10] = 80'h012bda8f6b496c5e5a49;
    stim[11] = 80'h4cb60dd6c5b64cf5dad0;
    stim[12] = 80'h38e76a48f371f4931861;
    stim[13] = 80'h67f7a692c4bab795ea7a;
    stim[14] = 80'h350b26fb6d24d403e11d;
    stim[15] = 80'h771b737ea8e7c77cf42a;
    stim[16] = 80'h2b5d4158cbf4494e63cb;
    stim[17] = 80'h29363796b99f462b104a;
    stim[18] = 80'h79bea1bf9931e8dd5e11;
    stim[19] = 80'h7cb86147545608ddd13a;
    stim[20] = 80'h02a6e3ab12c252993fcf;
    stim[21] = 80'h77cd176eeae5890d2bd2;
    stim[22] = 80'h61d2e5945765e2c57210;
    stim[23] = 80'h6dae499dce4def845e11;
    stim[24] = 80'h31a0bcd5f78c09d3f3ad;
    stim[25] = 80'h01d1e088aefc883a6dba;
    stim[26] = 80'h517788d5a5a1ae4bbe9a;
    stim[27] = 80'h6d978ac9d10703f04ebe;
    stim[28] = 80'h5e86ae537e00550cbba9;
    stim[29] = 80'h76a6e1a818b08f9bff09;
    stim[30] = 80'h5ecd2786e62b228158a3;
    stim[31] = 80'h587457df7bd2663b8d0e;
    stim[32] = 80'h1bb7e7323c9ddb028bd7;
    stim[33] = 80'h1a44964c91686cb85ba7;
    stim[34] = 80'h5186053db8c105a4bac9;
    stim[35] = 80'h1c2bbb4fa50a8fb226cf;
    stim[36] = 80'h311de31f2d9d9775b60a;
    stim[37] = 80'h113d9012797bba196d65;
    stim[38] = 80'h35e6c106ff560e2c0c40;
    stim[39] = 80'h1ecfb97b717664314a6b;
    stim[40] = 80'h36d3164bca904cb1bbf5;
    stim[41] = 80'h6b28f3434216c0837cf8;
    stim[42] = 80'h09cd07fb204e28ffe3bb;
    stim[43] = 80'h3b7311af8e8f4e345303;
    stim[44] = 80'h5480e848c1d82b29ce58;
    stim[45] = 80'h34930433e9f0f825f182;
    stim[46] = 80'h0dd220abbea611de48ff;
    stim[47] = 80'h32f11f6c7a44d73af6ba;
    stim[48] = 80'h516d41f48aa10642a118;
    stim[49] = 80'h598c3ba42d1964f8eda2;
    stim[50] = 80'h4e5092a919de52b3d98e;
    stim[51] = 80'h755a46953dd59bcfda00;
    stim[52] = 80'h5694d5f482d1133f84b8;
    stim[53] = 80'h656e1b256c9953363efb;
    stim[54] = 80'h1f106bb009a871d90430;
    stim[55] = 80'h3e7817b2057b33ad079c;
    stim[56] = 80'h5ee89b80aedbd3d918e8;
    stim[57] = 80'h16cc6c6c152bf20fb63d;
    stim[58] = 80'h20efa4de7ee2ec4e14f0;
    stim[59] = 80'h3e708c3611cf9b026e1e;
    stim[60] = 80'h4f7cb9e6b354ba5d6a82;
    stim[61] = 80'h1ca4280494737a2d6346;
    stim[62] = 80'h5da69c8bac00ebba8afb;
    stim[63] = 80'h59606e60f4a75c5599ff;
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
      expv[0] = 97'h0000000000000001f00400004;
      expv[1] = 97'h0000000000000001f00000000;
      expv[2] = 97'h0000000000000001f00400004;
      expv[3] = 97'h0000000000000001d00000000;
      expv[4] = 97'h0000000000000001f00400004;
      expv[5] = 97'h0000000000000001d00000000;
      expv[6] = 97'h0000000000000001f00000000;
      expv[7] = 97'h0000000000000001f00000000;
      expv[8] = 97'h0000000000000001f00000000;
      expv[9] = 97'h0000000000000001f00400004;
      expv[10] = 97'h0000000000000001f00000000;
      expv[11] = 97'h0000000000000001f00400004;
      expv[12] = 97'h0000000000000001f00000000;
      expv[13] = 97'h0000000000000001f00000000;
      expv[14] = 97'h0000000000000001f00000000;
      expv[15] = 97'h0000000000000001f00000000;
      expv[16] = 97'h0000000000000001f00400004;
      expv[17] = 97'h0000000000000001f00000000;
      expv[18] = 97'h13e8c56200000001f00000000;
      expv[19] = 97'h0000000000000001f00000000;
      expv[20] = 97'h04a97a69a0000001f00400004;
      expv[21] = 97'h079c058e80000001f00400004;
      expv[22] = 97'h0000000000000001f00000000;
      expv[23] = 97'h17cd176ee0000001f00000000;
      expv[24] = 97'h0cbc58ae40000001f00400004;
      expv[25] = 97'h11a0bcd5e0000001d00000000;
      expv[26] = 97'h0000000000000001d00000000;
      expv[27] = 97'h0000000000000001d00000000;
      expv[28] = 97'h0000000000000001d00000000;
      expv[29] = 97'h0000000000000001d00000000;
      expv[30] = 97'h0000000000000001d00000000;
      expv[31] = 97'h0000000000000001d00000000;
      expv[32] = 97'h0000000000000001d00000000;
      expv[33] = 97'h00e07e09c0000001f00400004;
      expv[34] = 97'h1611f37fe0000001d00000000;
      expv[35] = 97'h0000000000000001f00400004;
      expv[36] = 97'h049a807c20000001f00000000;
      expv[37] = 97'h063d1babc0000001f00000000;
      expv[38] = 97'h0e13890e40000001f00000000;
      expv[39] = 97'h00e07e09c0000001f00000000;
      expv[40] = 97'h1cb121a560000001f00400004;
      expv[41] = 97'h0000000000000001f00400004;
      expv[42] = 97'h0000000000000001f00400004;
      expv[43] = 97'h09cd07fb20000001d00000000;
      expv[44] = 97'h0000000000000001d00000000;
      expv[45] = 97'h0000000000000001f00400004;
      expv[46] = 97'h0000000000000001d00000000;
      expv[47] = 97'h0000000000000001f00400004;
      expv[48] = 97'h1209963760000001d00000000;
      expv[49] = 97'h13b2eeb6c0000001d00000000;
      expv[50] = 97'h063d1babc0000001d00000000;
      expv[51] = 97'h0000000000000001d00000000;
      expv[52] = 97'h02d8106f80000001d00000000;
      expv[53] = 97'h00000001c0000001d00000000;
      expv[54] = 97'h1e1f04be332a66c7f00000000;
      expv[55] = 97'h00000000132a66c7f00400004;
      expv[56] = 97'h1e7817b2132a66c7d00000000;
      expv[57] = 97'h00000000132a66c7f00000000;
      expv[58] = 97'h00000000132a66c7f00400004;
      expv[59] = 97'h00e07e09d32a66c7f00000000;
      expv[60] = 97'h0e3e9263132a66c7f00400004;
      expv[61] = 97'h0ac11bba332a66c7d00000000;
      expv[62] = 97'h132a66c7f32a66c7f00400004;
      expv[63] = 97'h0ac11bba332a66c7f00400004;
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
