// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 99;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_115079 dut (
    .clk(clk),
    .rst(in_vec[99:99]),
    .address(in_vec[98:67]),
    .read(in_vec[66:66]),
    .write(in_vec[65:65]),
    .wdata(in_vec[64:33]),
    .pmem_rdata(in_vec[32:1]),
    .pmem_resp(in_vec[0:0]),
    .rdata(out_vec[98:67]),
    .resp(out_vec[66:66]),
    .pmem_address(out_vec[65:34]),
    .pmem_read(out_vec[33:33]),
    .pmem_write(out_vec[32:32]),
    .pmem_wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h86ab428f5b53d04ef07bb4d55;
    stim[1] = 100'hb3ee22700840ea58c39563e88;
    stim[2] = 100'h26c08fc50aeba6a462ddd2188;
    stim[3] = 100'h7e0848e476dbd99c7d5c3ae75;
    stim[4] = 100'h3f51797b90325ea0d43ad53cd;
    stim[5] = 100'h15de7b66aa7f9db1316f94092;
    stim[6] = 100'h09766f02fe7fc30b6280e9146;
    stim[7] = 100'h1cf3dab600736d545b2a76235;
    stim[8] = 100'h6e0f64fbf26a9a965bebaa842;
    stim[9] = 100'h4fdd136bc05b10bc063cca695;
    stim[10] = 100'h4ffde8404fb2be1456f1b1a37;
    stim[11] = 100'h1389c6ef650b184691ead8149;
    stim[12] = 100'h65807923d174a4ed79b9882f8;
    stim[13] = 100'h28f8c45bcf9d3c84a2dc901e0;
    stim[14] = 100'h1798c1a1b04580b87bf38d103;
    stim[15] = 100'hd17a4b88bdcb94b3d36505917;
    stim[16] = 100'h123aba65ced53e5f781af176e;
    stim[17] = 100'h328151b0599d008ccef8de918;
    stim[18] = 100'h663c8f03e6725c1e4858299ab;
    stim[19] = 100'h393b69f530a96b1fc49639608;
    stim[20] = 100'h00eb4e77fb9729fc92add0237;
    stim[21] = 100'h14a7a7433a21e004e1cc17fbb;
    stim[22] = 100'h0d6f065d78bc8c0285ce17714;
    stim[23] = 100'h29be8dedea7fd0e5e26f9f761;
    stim[24] = 100'h06aa375a97735b7dbe5ad6ce4;
    stim[25] = 100'h1202572275a2303ae655052e8;
    stim[26] = 100'h3ed36ea9b08ce61fcdb4eb34d;
    stim[27] = 100'h0464c994e59ae15b7bb5d42a0;
    stim[28] = 100'h1b26e99ebcf631509f1871a2f;
    stim[29] = 100'h69e2503778e9095488e0d7e8a;
    stim[30] = 100'h0d2d3b4f98759b317f2b6b03d;
    stim[31] = 100'h40e665018db9d7c278f897119;
    stim[32] = 100'h33e154da21d8e7758b2e08ed9;
    stim[33] = 100'h041b51439361d6fe2a9c67e2f;
    stim[34] = 100'h13622e0b5e08991eb73e2dc5e;
    stim[35] = 100'h66fb2fb183e13238dd63c4517;
    stim[36] = 100'h04288858c6005f95d08fcaece;
    stim[37] = 100'h6e4663256d0175f0ba90bdab8;
    stim[38] = 100'h4073ce4f4feb7cb765e9ca96b;
    stim[39] = 100'h06b2802e563d730a643673b79;
    stim[40] = 100'h20624ca90b41f8d2283a8707a;
    stim[41] = 100'h0d2cc7b950ba08b668e4514e1;
    stim[42] = 100'h151314c714faed9e34d625c6b;
    stim[43] = 100'h09c99310ad13024ea202c529b;
    stim[44] = 100'hd3e97ca4d8374ca96a5aa8897;
    stim[45] = 100'h3cfd4fab2524d363d39445675;
    stim[46] = 100'h4679127d1d15917abec18e1a4;
    stim[47] = 100'h64e78be8247270f1aec598ce9;
    stim[48] = 100'h154c8c1bd52bdedbbd2076547;
    stim[49] = 100'h66c59deffc694a4281c50ea27;
    stim[50] = 100'h0491b21cd6f7f1c0936b95c5c;
    stim[51] = 100'h113a1b965ce2129c6e4bc2d24;
    stim[52] = 100'h1b331386a6a0a82e2508d82a8;
    stim[53] = 100'he2521404bb29b262287181362;
    stim[54] = 100'h77d9d46b7f906c8dc3b33e149;
    stim[55] = 100'h243c309d7738555d00fb35519;
    stim[56] = 100'h3ba0266671ec4892c88a7937f;
    stim[57] = 100'h272acef3130e0c488b1d07667;
    stim[58] = 100'h0bf704777117d7c7a22c9dacd;
    stim[59] = 100'h28726a991b95fa56219361aa0;
    stim[60] = 100'h66929de9722efc33eb0a6e1d9;
    stim[61] = 100'h270dbb54915485093cb8098be;
    stim[62] = 100'h562546f28de52e7baf9522ce5;
    stim[63] = 100'h687eecd50b68fcde743258c88;
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
      expv[0] = 99'h0000000000000000000000000;
      expv[1] = 99'h0000000000000000000000000;
      expv[2] = 99'h0000000000000000000000000;
      expv[3] = 99'h0000000040000000000000000;
      expv[4] = 99'h0000000000000000000000000;
      expv[5] = 99'h0000000040000000000000000;
      expv[6] = 99'h0a03a451c4bb3781753fced89;
      expv[7] = 99'h0000000000000000000000000;
      expv[8] = 99'h0000000040000000000000000;
      expv[9] = 99'h18f329a567ee89b5f9354d4b2;
      expv[10] = 99'h5bc6c68de7fef420200000000;
      expv[11] = 99'h0000000040000000000000000;
      expv[12] = 99'h66e620be32c03c91e00000000;
      expv[13] = 99'h0b724078147c622de00000000;
      expv[14] = 99'h0000000040000000000000000;
      expv[15] = 99'h000000004bcc60d0d822c05c3;
      expv[16] = 99'h606bc5db891d5d32e00000000;
      expv[17] = 99'h3be37a461940a8d8200000000;
      expv[18] = 99'h0000000040000000000000000;
      expv[19] = 99'h0000000040000000000000000;
      expv[20] = 99'h4ab7408dc075a73bf854b58fe;
      expv[21] = 99'h0000000040000000000000000;
      expv[22] = 99'h17385dc546b7832ebd10f0027;
      expv[23] = 99'h0000000040000000000000000;
      expv[24] = 99'h0000000014df46f6d53fe872f;
      expv[25] = 99'h195414ba49012b91353fe872f;
      expv[26] = 99'h0000000040000000000000000;
      expv[27] = 99'h6ed750a8423264ca7846730fe;
      expv[28] = 99'h0000000040000000000000000;
      expv[29] = 99'h23835fa2f4f1281bbe7b18a84;
      expv[30] = 99'h0000000000000000000000000;
      expv[31] = 99'h0000000000000000000000000;
      expv[32] = 99'h0000000040000000000000000;
      expv[33] = 99'h0000000019f0aa6d10ec73bac;
      expv[34] = 99'h5cf8b71789b11705a00000000;
      expv[35] = 99'h0000000000000000000000000;
      expv[36] = 99'h423f2bb38214442c600000000;
      expv[37] = 99'h0000000040000000000000000;
      expv[38] = 99'h17a72a5ae039e727a00000000;
      expv[39] = 99'h10d9cede43594017200000000;
      expv[40] = 99'h0000000000000000000000000;
      expv[41] = 99'h23914538469663dca00000000;
      expv[42] = 99'h0000000000000000000000000;
      expv[43] = 99'h0000000040000000000000000;
      expv[44] = 99'h296aa225e9f4be52768981275;
      expv[45] = 99'h0000000040000000000000000;
      expv[46] = 99'h0000000000000000000000000;
      expv[47] = 99'h0000000040000000000000000;
      expv[48] = 99'h7481d951caa6460df2393878d;
      expv[49] = 99'h0000000040000000000000000;
      expv[50] = 99'h4dae57170248d90e600000000;
      expv[51] = 99'h392f0b49089d0dcb200000000;
      expv[52] = 99'h0000000040000000000000000;
      expv[53] = 99'h000000004d9989c3535054171;
      expv[54] = 99'h0000000040000000000000000;
      expv[55] = 99'h0000000040000000000000000;
      expv[56] = 99'h2229e4dfddd013333b9c2aae8;
      expv[57] = 99'h0000000000000000000000000;
      expv[58] = 99'h0000000040000000000000000;
      expv[59] = 99'h0000000005fb823b988bebe3d;
      expv[60] = 99'h2c29b87673494ef4b88bebe3d;
      expv[61] = 99'h0000000000000000000000000;
      expv[62] = 99'h0000000000000000000000000;
      expv[63] = 99'h0000000000000000000000000;
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
