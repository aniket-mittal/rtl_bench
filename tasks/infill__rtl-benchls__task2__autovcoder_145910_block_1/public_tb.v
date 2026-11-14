// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_145910 dut (
    .clk(clk),
    .reset(in_vec[52:52]),
    .start_ch0(in_vec[51:51]),
    .stop_ch0(in_vec[50:50]),
    .src_addr_ch0(in_vec[49:42]),
    .dest_addr_ch0(in_vec[41:34]),
    .data_in_ch0(in_vec[33:26]),
    .start_ch1(in_vec[25:25]),
    .stop_ch1(in_vec[24:24]),
    .src_addr_ch1(in_vec[23:16]),
    .dest_addr_ch1(in_vec[15:8]),
    .data_in_ch1(in_vec[7:0]),
    .data_out_ch0(out_vec[17:10]),
    .busy_ch0(out_vec[9:9]),
    .data_out_ch1(out_vec[8:1]),
    .busy_ch1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h1b0db666c35bd2;
    stim[1] = 53'h1d87d44161c7e7;
    stim[2] = 53'h06d0794fd92959;
    stim[3] = 53'h0f53a564a067f2;
    stim[4] = 53'h035acfa0aa5f57;
    stim[5] = 53'h0e5df797354bec;
    stim[6] = 53'h08304c51dd62b0;
    stim[7] = 53'h020d853565d473;
    stim[8] = 53'h1b8e9ca728a0d1;
    stim[9] = 53'h0c231874e186b4;
    stim[10] = 53'h0a566cbaaf8428;
    stim[11] = 53'h0cafd1a7c04a9b;
    stim[12] = 53'h0678eab581b193;
    stim[13] = 53'h02e568e30c7799;
    stim[14] = 53'h0bfc2316795d40;
    stim[15] = 53'h04842390414278;
    stim[16] = 53'h0b916376553668;
    stim[17] = 53'h041b29fe0723da;
    stim[18] = 53'h0bad2bcf94cb23;
    stim[19] = 53'h085f4297f8cacb;
    stim[20] = 53'h061773ce850f9d;
    stim[21] = 53'h048138414aef29;
    stim[22] = 53'h0a34f37919c645;
    stim[23] = 53'h04d6d5683e4eaa;
    stim[24] = 53'h0703a95d049625;
    stim[25] = 53'h0b53b65573b5c5;
    stim[26] = 53'h0aa2b289368449;
    stim[27] = 53'h08114b249f4a24;
    stim[28] = 53'h0bff3f5675f4dd;
    stim[29] = 53'h0bf2b1a5591a31;
    stim[30] = 53'h0b12aeb85b0a67;
    stim[31] = 53'h02c8df50fa0ed7;
    stim[32] = 53'h086d4869bf2175;
    stim[33] = 53'h012d1661b0898e;
    stim[34] = 53'h04fc4d7785bb58;
    stim[35] = 53'h07207a53df63ee;
    stim[36] = 53'h0af2b2d22521b1;
    stim[37] = 53'h04313759692554;
    stim[38] = 53'h0bde6f5f33ed61;
    stim[39] = 53'h00585f4dc9e01c;
    stim[40] = 53'h02df0f65c52b45;
    stim[41] = 53'h09c92f7fbb0805;
    stim[42] = 53'h0499d6dd002230;
    stim[43] = 53'h0a5d194f35a2a8;
    stim[44] = 53'h0a7af5a370e87d;
    stim[45] = 53'h0cc8d95b4b0b57;
    stim[46] = 53'h07f3aa5c2f3dba;
    stim[47] = 53'h0849adaeec6b9a;
    stim[48] = 53'h07e4cdc53e3f17;
    stim[49] = 53'h053f65b15641d5;
    stim[50] = 53'h0267893e2a3b2c;
    stim[51] = 53'h0c6750f43a1b94;
    stim[52] = 53'h03bb01d06bd2c6;
    stim[53] = 53'h08baf46cc795d6;
    stim[54] = 53'h023e2540d31a0c;
    stim[55] = 53'h0f1230444b76ef;
    stim[56] = 53'h0a6b664baf56f4;
    stim[57] = 53'h066afbd82e1e61;
    stim[58] = 53'h0009930cf991a4;
    stim[59] = 53'h0f9a0a58261fd6;
    stim[60] = 53'h0809dcbcb8cde1;
    stim[61] = 53'h05907846575fce;
    stim[62] = 53'h017927ea38aeef;
    stim[63] = 53'h0cb03b7ec34d6a;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h000b2;
      expv[4] = 18'h164b2;
      expv[5] = 18'h164b2;
      expv[6] = 18'h395d8;
      expv[7] = 18'h053d8;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h07400;
      expv[11] = 18'h0ba51;
      expv[12] = 18'h0b850;
      expv[13] = 18'h0b850;
      expv[14] = 18'h0b932;
      expv[15] = 18'h31681;
      expv[16] = 18'h31481;
      expv[17] = 18'h37681;
      expv[18] = 18'h37481;
      expv[19] = 18'h3ce80;
      expv[20] = 18'h3cf96;
      expv[21] = 18'h3cd3b;
      expv[22] = 18'h3cd3a;
      expv[23] = 18'h37b3a;
      expv[24] = 18'h3793a;
      expv[25] = 18'h3793a;
      expv[26] = 18'h2573a;
      expv[27] = 18'h2573a;
      expv[28] = 18'h2573a;
      expv[29] = 18'h257bb;
      expv[30] = 18'h257ba;
      expv[31] = 18'h257ba;
      expv[32] = 18'h257ba;
      expv[33] = 18'h257ba;
      expv[34] = 18'h257ba;
      expv[35] = 18'h254b0;
      expv[36] = 18'h255dc;
      expv[37] = 18'h2d363;
      expv[38] = 18'h2d162;
      expv[39] = 18'h35ec2;
      expv[40] = 18'h35ec2;
      expv[41] = 18'h35ec2;
      expv[42] = 18'h35e0a;
      expv[43] = 18'h35c0a;
      expv[44] = 18'h14f50;
      expv[45] = 18'h14efa;
      expv[46] = 18'h14cae;
      expv[47] = 18'h14cae;
      expv[48] = 18'h1af35;
      expv[49] = 18'h1ad34;
      expv[50] = 18'h1ad34;
      expv[51] = 18'h1ac59;
      expv[52] = 18'h0f459;
      expv[53] = 18'h0f459;
      expv[54] = 18'h06e59;
      expv[55] = 18'h06e59;
      expv[56] = 18'h06c59;
      expv[57] = 18'h24a58;
      expv[58] = 18'h24858;
      expv[59] = 18'h24858;
      expv[60] = 18'h25858;
      expv[61] = 18'h0be58;
      expv[62] = 18'h0bd9d;
      expv[63] = 18'h0bd9d;
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
