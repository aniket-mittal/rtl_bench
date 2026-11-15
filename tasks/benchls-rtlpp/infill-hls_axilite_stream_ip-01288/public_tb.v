// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01288 dut (
    .ap_clk(clk),
    .ap_rst_n(in_vec[77:77]),
    .s_axilite_AWVALID(in_vec[76:76]),
    .s_axilite_AWADDR(in_vec[75:71]),
    .s_axilite_WVALID(in_vec[70:70]),
    .s_axilite_WDATA(in_vec[69:38]),
    .s_axilite_WSTRB(in_vec[37:34]),
    .s_axilite_BREADY(in_vec[33:33]),
    .s_axilite_ARVALID(in_vec[32:32]),
    .s_axilite_ARADDR(in_vec[31:27]),
    .s_axilite_RREADY(in_vec[26:26]),
    .in0_V_TVALID(in_vec[25:25]),
    .in0_V_TDATA(in_vec[24:1]),
    .out_V_TREADY(in_vec[0:0]),
    .s_axilite_AWREADY(out_vec[66:66]),
    .s_axilite_WREADY(out_vec[65:65]),
    .s_axilite_BVALID(out_vec[64:64]),
    .s_axilite_BRESP(out_vec[63:62]),
    .s_axilite_ARREADY(out_vec[61:61]),
    .s_axilite_RVALID(out_vec[60:60]),
    .s_axilite_RDATA(out_vec[59:28]),
    .s_axilite_RRESP(out_vec[27:26]),
    .in0_V_TREADY(out_vec[25:25]),
    .out_V_TVALID(out_vec[24:24]),
    .out_V_TDATA(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h091c75ea692b2a432f22;
    stim[1] = 78'h1921c3ca5070a968bb21;
    stim[2] = 78'h2d5522e572d8e48576b2;
    stim[3] = 78'h3b5c1dbb85c2b3440993;
    stim[4] = 78'h25d27969e2dee2ec2e1a;
    stim[5] = 78'h3849e8ac7f2991707c5a;
    stim[6] = 78'h3189d34fd914e77d2901;
    stim[7] = 78'h2e543c502f88b6f0a78e;
    stim[8] = 78'h3ae4da679c3a19cc5493;
    stim[9] = 78'h351885ec0402f2fea77e;
    stim[10] = 78'h21f826b964e909cb634b;
    stim[11] = 78'h3f80f9a63a61d2533016;
    stim[12] = 78'h302fe1ee1860b1a5374d;
    stim[13] = 78'h0964f1c9afcf32994141;
    stim[14] = 78'h3821b14fc6c2d0387cab;
    stim[15] = 78'h27157e4bff345fb7e65b;
    stim[16] = 78'h2d2ae1f62c7f08c29f07;
    stim[17] = 78'h2d27f8020a101931b9fe;
    stim[18] = 78'h21bfc71c2bdbd577d3e2;
    stim[19] = 78'h3f86c6f2d2c528db4176;
    stim[20] = 78'h31cf09e7c873d6ea6998;
    stim[21] = 78'h3fdde493fd0956a21e77;
    stim[22] = 78'h323579def3b5694bc337;
    stim[23] = 78'h301adb9fbd53410eb8ad;
    stim[24] = 78'h236e89dd74aab01da571;
    stim[25] = 78'h284f3a8a308a41c07957;
    stim[26] = 78'h25b57842040e1202d009;
    stim[27] = 78'h3be1ea61837c32d2c117;
    stim[28] = 78'h30c4ebbfb2ae8e68f64e;
    stim[29] = 78'h37f8382e01e51b5b5a96;
    stim[30] = 78'h2898e26ef30331d6fe80;
    stim[31] = 78'h3f59b934fb9e31c77811;
    stim[32] = 78'h2710519e946d414401bb;
    stim[33] = 78'h2e3db4291ae0888c7b0e;
    stim[34] = 78'h2e820278f9872d082549;
    stim[35] = 78'h3ebbf511a833bfa42ef3;
    stim[36] = 78'h3355b54e5f32d91faeec;
    stim[37] = 78'h2aba2a164a4759e5f5fa;
    stim[38] = 78'h349723e518aefab2b11d;
    stim[39] = 78'h3ee1bad9cf2bd49a5aac;
    stim[40] = 78'h23a3ac180448cf1c5a7f;
    stim[41] = 78'h2b4eb88abfb04c8a4175;
    stim[42] = 78'h3d2d796ecc2123fb3b9a;
    stim[43] = 78'h3af3e46b6a9e5752c1fe;
    stim[44] = 78'h3b9bfeac17b9b945c6fa;
    stim[45] = 78'h3ab891318e4bb01544f9;
    stim[46] = 78'h37dc109e963ed70c700a;
    stim[47] = 78'h0c161e152fcf2cf4dc7e;
    stim[48] = 78'h345be1820edb2f0881f3;
    stim[49] = 78'h2442030033661fd4a3cd;
    stim[50] = 78'h336b4bb04714d2152d83;
    stim[51] = 78'h2c1bfd150b59ea0dd99d;
    stim[52] = 78'h2762480a1f990f40c117;
    stim[53] = 78'h32d59060ad7d2c980c66;
    stim[54] = 78'h2501f8db78f66bad31aa;
    stim[55] = 78'h236bb1bc0ac64702dd4c;
    stim[56] = 78'h28ab19f43f8a7b306eaa;
    stim[57] = 78'h3cb145a5fcb23a421bd0;
    stim[58] = 78'h3924c2e4aaa3293ef45c;
    stim[59] = 78'h296d9d66fc0039137ee0;
    stim[60] = 78'h30a8a8d246990976fdb1;
    stim[61] = 78'h2d6213b39b781ec0cb59;
    stim[62] = 78'h3725a8cbc04d5cd30624;
    stim[63] = 78'h29b1b2929af38ff8d458;
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
      expv[0] = 67'h00000000000000000;
      expv[1] = 67'h00000000000000000;
      expv[2] = 67'h00000000000000000;
      expv[3] = 67'h00000000000000000;
      expv[4] = 67'h40000000003a204c9;
      expv[5] = 67'h60000000000a204c9;
      expv[6] = 67'h12000000000a204c9;
      expv[7] = 67'h52000000003be9480;
      expv[8] = 67'h72000000000be9480;
      expv[9] = 67'h62000000000be9480;
      expv[10] = 67'h62000000000be9480;
      expv[11] = 67'h11deadbeef0be9480;
      expv[12] = 67'h53deadbeef0be9480;
      expv[13] = 67'h00000000000000000;
      expv[14] = 67'h00000000000000000;
      expv[15] = 67'h40000000000000000;
      expv[16] = 67'h40000000003dbf32d;
      expv[17] = 67'h42000000000dbf32d;
      expv[18] = 67'h42000000000dbf32d;
      expv[19] = 67'h41deadbeef0dbf32d;
      expv[20] = 67'h43deadbeef0dbf32d;
      expv[21] = 67'h62deadbeef0dbf32d;
      expv[22] = 67'h11deadbeef3510f3b;
      expv[23] = 67'h53deadbeef0510f3b;
      expv[24] = 67'h43deadbeef0510f3b;
      expv[25] = 67'h63deadbeef0510f3b;
      expv[26] = 67'h13deadbeef0510f3b;
      expv[27] = 67'h03deadbeef3016804;
      expv[28] = 67'h43deadbeef369608b;
      expv[29] = 67'h62deadbeef069608b;
      expv[30] = 67'h11deadbeef069608b;
      expv[31] = 67'h03deadbeef069608b;
      expv[32] = 67'h43deadbeef069608b;
      expv[33] = 67'h43deadbeef069608b;
      expv[34] = 67'h43deadbeef069608b;
      expv[35] = 67'h42deadbeef069608b;
      expv[36] = 67'h41deadbeef3d21779;
      expv[37] = 67'h61deadbeef0d21779;
      expv[38] = 67'h63deadbeef0d21779;
      expv[39] = 67'h63deadbeef359588e;
      expv[40] = 67'h12deadbeef059588e;
      expv[41] = 67'h12deadbeef38e2d3f;
      expv[42] = 67'h12deadbeef08e2d3f;
      expv[43] = 67'h51deadbeef08e2d3f;
      expv[44] = 67'h60deadbeef08e2d3f;
      expv[45] = 67'h62deadbeef08e2d3f;
      expv[46] = 67'h61deadbeef08e2d3f;
      expv[47] = 67'h00000000000000000;
      expv[48] = 67'h00000000000000000;
      expv[49] = 67'h420000000038440f9;
      expv[50] = 67'h62000000003ea51e6;
      expv[51] = 67'h120000000030a96c1;
      expv[52] = 67'h11deadbeef306ecce;
      expv[53] = 67'h12deadbeef3a0608b;
      expv[54] = 67'h51deadbeef0a0608b;
      expv[55] = 67'h41deadbeef0a0608b;
      expv[56] = 67'h60deadbeef0a0608b;
      expv[57] = 67'h60deadbeef0a0608b;
      expv[58] = 67'h60deadbeef0a0608b;
      expv[59] = 67'h62deadbeef0a0608b;
      expv[60] = 67'h12deadbeef0a0608b;
      expv[61] = 67'h51deadbeef0a0608b;
      expv[62] = 67'h70deadbeef36065ac;
      expv[63] = 67'h72deadbeef06065ac;
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
