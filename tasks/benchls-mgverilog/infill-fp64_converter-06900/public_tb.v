// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06900 dut (
    .clk(clk),
    .input_a(in_vec[66:3]),
    .input_a_stb(in_vec[2:2]),
    .output_z_ack(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .output_z(out_vec[65:2]),
    .output_z_stb(out_vec[1:1]),
    .input_a_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h0da2af67d9ec2ece5;
    stim[1] = 67'h019f33aa69c2cf779;
    stim[2] = 67'h6aa39a4045a0b70ee;
    stim[3] = 67'h3e6f584451609bc2c;
    stim[4] = 67'h56f896213e1927816;
    stim[5] = 67'h7af2439adbd49533e;
    stim[6] = 67'h412497f5ec2246e76;
    stim[7] = 67'h09be040fae26b12dc;
    stim[8] = 67'h17cbf1daf14aaa828;
    stim[9] = 67'h14b6616118d64ffb8;
    stim[10] = 67'h635ac8b033d01728e;
    stim[11] = 67'h3e2ea59f18563bf94;
    stim[12] = 67'h3877f0bef86f6fabc;
    stim[13] = 67'h017a954cf9aa1ab88;
    stim[14] = 67'h5c144c9657a0044e0;
    stim[15] = 67'h2947b84685af8f594;
    stim[16] = 67'h1c4b3eba548f84b06;
    stim[17] = 67'h60bf7fa062f131a02;
    stim[18] = 67'h68224a5cdab027496;
    stim[19] = 67'h3b9bc5cc443f70770;
    stim[20] = 67'h36cd990b4cfd270d8;
    stim[21] = 67'h34bf91909ed84c6c8;
    stim[22] = 67'h0f8862cedb491855c;
    stim[23] = 67'h50c258fd461fe7bf8;
    stim[24] = 67'h2dc42800288d29a0a;
    stim[25] = 67'h2610ad40d76bf4096;
    stim[26] = 67'h0a4fe2f0f0dfd6814;
    stim[27] = 67'h2bd41994b9e0423aa;
    stim[28] = 67'h750b0f2436c631220;
    stim[29] = 67'h3d31b58a2e55f3908;
    stim[30] = 67'h10b9cfcbc2e521b34;
    stim[31] = 67'h6a9c9b4edeeb80d08;
    stim[32] = 67'h654209406b0092b50;
    stim[33] = 67'h37e0c48ee2f147c40;
    stim[34] = 67'h35cdd8c66b119215c;
    stim[35] = 67'h0a12f86cd032ad110;
    stim[36] = 67'h1903839b602950362;
    stim[37] = 67'h7b20ce4609f25099e;
    stim[38] = 67'h3c0a266b41ff6d51e;
    stim[39] = 67'h6fc19cf64cc929146;
    stim[40] = 67'h462887a960b8fea68;
    stim[41] = 67'h68843dcdcab91fdc8;
    stim[42] = 67'h3fef43f13daded16c;
    stim[43] = 67'h674ec9f2d216fbb5c;
    stim[44] = 67'h5599f3ecb6fbb9420;
    stim[45] = 67'h049753724f9a9b244;
    stim[46] = 67'h48eab158b9c78b054;
    stim[47] = 67'h2c57735d3d7599bb8;
    stim[48] = 67'h24ffd4ae5d3edee52;
    stim[49] = 67'h519f6a68aff68e0e2;
    stim[50] = 67'h324d5c9ff5deabe26;
    stim[51] = 67'h79c72db257967210e;
    stim[52] = 67'h0e4172c1640029956;
    stim[53] = 67'h45b9ec27e0ed36168;
    stim[54] = 67'h00592078f118f029a;
    stim[55] = 67'h538d2593d2c149f78;
    stim[56] = 67'h3d67a74710e211b94;
    stim[57] = 67'h14025604dcc1b59a2;
    stim[58] = 67'h60ad684fd6c17f5ac;
    stim[59] = 67'h20efc799c06fc84d4;
    stim[60] = 67'h55448d1434bda9024;
    stim[61] = 67'h743955fdbc023c1c2;
    stim[62] = 67'h058ae6a96a96821c4;
    stim[63] = 67'h528e8d6a3f86bee00;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'hxxxxxxxxxxxxxxxxx;
      expv[4] = 66'hxxxxxxxxxxxxxxxxx;
      expv[5] = 66'hxxxxxxxxxxxxxxxxx;
      expv[6] = 66'hxxxxxxxxxxxxxxxxx;
      expv[7] = 66'h00000000000000002;
      expv[8] = 66'h00000000000000002;
      expv[9] = 66'h00000000000000002;
      expv[10] = 66'h00000000000000002;
      expv[11] = 66'h00000000000000000;
      expv[12] = 66'h00000000000000001;
      expv[13] = 66'h00000000000000000;
      expv[14] = 66'h00000000000000000;
      expv[15] = 66'h00000000000000000;
      expv[16] = 66'h00000000000000002;
      expv[17] = 66'h00000000000000000;
      expv[18] = 66'h00000000000000001;
      expv[19] = 66'h00000000000000000;
      expv[20] = 66'h00000000000000000;
      expv[21] = 66'h00000000000000000;
      expv[22] = 66'h20000000000000002;
      expv[23] = 66'h20000000000000002;
      expv[24] = 66'h20000000000000002;
      expv[25] = 66'h20000000000000000;
      expv[26] = 66'h20000000000000001;
      expv[27] = 66'h20000000000000000;
      expv[28] = 66'h20000000000000000;
      expv[29] = 66'h20000000000000000;
      expv[30] = 66'h20000000000000000;
      expv[31] = 66'h20000000000000000;
      expv[32] = 66'h20000000000000000;
      expv[33] = 66'h20000000000000000;
      expv[34] = 66'h20000000000000000;
      expv[35] = 66'h20000000000000000;
      expv[36] = 66'h20000000000000000;
      expv[37] = 66'h20000000000000000;
      expv[38] = 66'h20000000000000000;
      expv[39] = 66'h20000000000000000;
      expv[40] = 66'h20000000000000000;
      expv[41] = 66'h20000000000000000;
      expv[42] = 66'h20000000000000000;
      expv[43] = 66'h20000000000000000;
      expv[44] = 66'h20000000000000000;
      expv[45] = 66'h20000000000000000;
      expv[46] = 66'h20000000000000000;
      expv[47] = 66'h20000000000000000;
      expv[48] = 66'h20000000000000000;
      expv[49] = 66'h20000000000000000;
      expv[50] = 66'h20000000000000000;
      expv[51] = 66'h20000000000000000;
      expv[52] = 66'h20000000000000000;
      expv[53] = 66'h20000000000000000;
      expv[54] = 66'h20000000000000000;
      expv[55] = 66'h20000000000000000;
      expv[56] = 66'h20000000000000000;
      expv[57] = 66'h20000000000000000;
      expv[58] = 66'h20000000000000000;
      expv[59] = 66'h20000000000000000;
      expv[60] = 66'h20000000000000000;
      expv[61] = 66'h20000000000000000;
      expv[62] = 66'h20000000000000000;
      expv[63] = 66'h20000000000000000;
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
