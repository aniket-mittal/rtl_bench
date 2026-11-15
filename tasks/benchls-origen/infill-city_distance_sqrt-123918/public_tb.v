// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_123918 dut (
    .clk(clk),
    .rst(in_vec[129:129]),
    .citya(in_vec[128:65]),
    .cityb(in_vec[64:1]),
    .inp_valid(in_vec[0:0]),
    .out_valid(out_vec[32:32]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h2e8bcc521ca9b72a99b49cc8e870457ce;
    stim[1] = 130'h3daf8c8cb91d92edb5abdee5d523d68b1;
    stim[2] = 130'h0f1dce23f26f7e9d1f95a26d03e592cfc;
    stim[3] = 130'h1774f18701b3736c10451d8d56dc4c7a1;
    stim[4] = 130'h11ae225665ae258a18d9dadc95762bc6b;
    stim[5] = 130'h03d5b50531f42b52af7df35513cdc134d;
    stim[6] = 130'h1e0b4c4a380bfbbcd14e16b7598975062;
    stim[7] = 130'h16db11f861cb044921eead1339e194653;
    stim[8] = 130'h04e0e2751e31b513291b259f78790022f;
    stim[9] = 130'h11a3444670a30cf06d906be52547fd699;
    stim[10] = 130'h1aa4748689066147739921972f0e3c1e7;
    stim[11] = 130'h13d32e214e1762d75117db0465327b096;
    stim[12] = 130'h02752d02a6299c9c2a248663da943e4c1;
    stim[13] = 130'h07a2109c38b9e213543e9e2d316854957;
    stim[14] = 130'h10c47cbd06ca66277751942cca465652c;
    stim[15] = 130'h0dc72cab2e817c9e59247f2c1b525f4f2;
    stim[16] = 130'h185a1f2ec978427ffaf33120e141a1e27;
    stim[17] = 130'h0c906ec0a33e4fa530cf2d3cb9dd8035f;
    stim[18] = 130'h183962eefc01181c12ab99121a1f52858;
    stim[19] = 130'h19a5d543408b5604de37b7f905c8e6146;
    stim[20] = 130'h00e049bcc97e3e89153968d2427bc07e9;
    stim[21] = 130'h0836133c012829f6d80dc21ca17bc11d8;
    stim[22] = 130'h1bec7a2b109ee4ee1a5e82cb6ec9f07ca;
    stim[23] = 130'h1fd3ac8bdc7bba455a3057998513a8458;
    stim[24] = 130'h09a9c89c025c4222ef76353928fe7f6d4;
    stim[25] = 130'h030c3da936ab1510c1e25222a158124e8;
    stim[26] = 130'h08b5d5a4972411c620df6c5d6a6209768;
    stim[27] = 130'h0ec237efa3a2e65bbfa939111da10c92f;
    stim[28] = 130'h15e97c6ef2e0e052ce7dae9401e7624a4;
    stim[29] = 130'h1e971276eca2166d6209eaf678c77ed3b;
    stim[30] = 130'h16d5e76daa6005ea205e287c689a81874;
    stim[31] = 130'h1739cd4f2a80e9e57fdf09bd4643c4004;
    stim[32] = 130'h01b4ca996756fca3d7c685ba6cb19ab4c;
    stim[33] = 130'h08e7d8a220726d8f1f098389d28e48c23;
    stim[34] = 130'h0cc5cb2bad470133b0115c87a3649682c;
    stim[35] = 130'h02049845cae1e7942c88889f8c309899e;
    stim[36] = 130'h0c901273086985fa5adae3db8ca468c8b;
    stim[37] = 130'h112de3a4164408baf53cbaa668db62c9f;
    stim[38] = 130'h18738f7b874f4cb370048d5b20f565965;
    stim[39] = 130'h0dec9345d3a54e732e01dcd7fbf7d0bbf;
    stim[40] = 130'h139fca2d8ffc9889778cbdf2663bd68ee;
    stim[41] = 130'h14307e5244c5742b7d282ae70a7d7adfc;
    stim[42] = 130'h1c49939abea497988354d3c6ab0793c62;
    stim[43] = 130'h12c1cdfbec5b849eee0857503514504c4;
    stim[44] = 130'h11b6f326115b1df1109a61fb4f0424b85;
    stim[45] = 130'h074e906aae38276e706b4e4f9fa618c27;
    stim[46] = 130'h1a20c29af438ba93c7ec36425b685c1fe;
    stim[47] = 130'h1edd8ac56eb895d436ec270a1e1c8dfa5;
    stim[48] = 130'h1703d0ed45b9452653c3746fb6299b3ae;
    stim[49] = 130'h0992e2bb8cbbc881e636d48645c53d311;
    stim[50] = 130'h19fd328ef58ad1c06a05a25793ff63a8f;
    stim[51] = 130'h1c5dfc4ad68e4dfff4bfc1af5ee14a434;
    stim[52] = 130'h045312fa5182a7b43e9de549601c7eefe;
    stim[53] = 130'h0f88d844cd10e199880ff2c71f0e779ba;
    stim[54] = 130'h0f21ed34281bcbe75595cff0ff83c0ce1;
    stim[55] = 130'h15bc1bed1583dd902209f50dc8236889d;
    stim[56] = 130'h147c406218a7213cf180758180abdf3f0;
    stim[57] = 130'h10bbc03ac9ac48856420c6f8eb3e263ba;
    stim[58] = 130'h1bc3d9d58e4b355409c645326b2b84172;
    stim[59] = 130'h191a40dce39d82cf173268cabad8a3bd4;
    stim[60] = 130'h070ce67a8d9e505f150f6616b0aa5d69b;
    stim[61] = 130'h0f80e15038fa09265d9ca509edb615564;
    stim[62] = 130'h1646f5f9e1e415dc23546eeba600ee45b;
    stim[63] = 130'h14515c816fa3f9e6e1e414bb018e35892;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h100000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h100000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h00000b8ba;
      expv[18] = 33'h10000b8ba;
      expv[19] = 33'h00000b8ba;
      expv[20] = 33'h00000b8ba;
      expv[21] = 33'h00000b8ba;
      expv[22] = 33'h00000b8ba;
      expv[23] = 33'h00000b8ba;
      expv[24] = 33'h000005c2e;
      expv[25] = 33'h100005c2e;
      expv[26] = 33'h000005c2e;
      expv[27] = 33'h000005c2e;
      expv[28] = 33'h000005c2e;
      expv[29] = 33'h000005c2e;
      expv[30] = 33'h000005c2e;
      expv[31] = 33'h000002cb1;
      expv[32] = 33'h100002cb1;
      expv[33] = 33'h000002cb1;
      expv[34] = 33'h000002cb1;
      expv[35] = 33'h000002cb1;
      expv[36] = 33'h000002cb1;
      expv[37] = 33'h00000634f;
      expv[38] = 33'h10000634f;
      expv[39] = 33'h00000634f;
      expv[40] = 33'h00000634f;
      expv[41] = 33'h00000634f;
      expv[42] = 33'h00000fe81;
      expv[43] = 33'h10000fe81;
      expv[44] = 33'h00000fe81;
      expv[45] = 33'h00000fe81;
      expv[46] = 33'h00000fe81;
      expv[47] = 33'h00000fe81;
      expv[48] = 33'h000003d41;
      expv[49] = 33'h100003d41;
      expv[50] = 33'h000003d41;
      expv[51] = 33'h000003d41;
      expv[52] = 33'h000003d41;
      expv[53] = 33'h00000662a;
      expv[54] = 33'h10000662a;
      expv[55] = 33'h00000662a;
      expv[56] = 33'h00000662a;
      expv[57] = 33'h00000662a;
      expv[58] = 33'h00000f9ae;
      expv[59] = 33'h10000f9ae;
      expv[60] = 33'h00000f9ae;
      expv[61] = 33'h00000f9ae;
      expv[62] = 33'h00000f9ae;
      expv[63] = 33'h00000f9ae;
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
