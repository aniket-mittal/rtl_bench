// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 224;
  localparam OW = 143;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062611 dut (
    .clk(clk),
    .rst(in_vec[223:223]),
    .cell_id_to_sum(in_vec[222:98]),
    .cell_id_access_valid(in_vec[97:97]),
    .number_of_partical(in_vec[96:1]),
    .valid_in(in_vec[0:0]),
    .access_address(out_vec[142:128]),
    .cell_id(out_vec[127:3]),
    .rd_en(out_vec[2:2]),
    .resume(out_vec[1:1]),
    .valid_out_to_adder(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 224'hd3bc6d3f2772f70cffcaa5b62c29694f3bd13c96591144745add2fd7;
    stim[1] = 224'he5c6d751f92eb6875f922a5dc5d58c3c3644750b9cfa1f7516571d77;
    stim[2] = 224'h7384e5b719032e9205f087907290234a8386707fd2b40722cbf7d822;
    stim[3] = 224'h2ad880b1d138891a57a0af91344efcd9896e011a3086974f199ee976;
    stim[4] = 224'h0a3fd10d579a5d684ea108c8eb260cd4791abaa2e15b5b10cbf18f23;
    stim[5] = 224'h110c700a133fa89ed4f84ade59902388b7ac34d7244f7ec43e23b898;
    stim[6] = 224'h50d974e7020b25a75c644dcce580bf932cb3beb910b220a2458c75b6;
    stim[7] = 224'h4dd4630ab478fbaa9a11c9f0153e42b468fa942e1d241a82dd1b7fcc;
    stim[8] = 224'h40bb52342e61db82efb415ece610f6c9d61622aba037b02099e4a78b;
    stim[9] = 224'h3d2612be300b744daa6c8750c8a5ed27ff4efba19c2260c4937d0d5f;
    stim[10] = 224'h386765634a0c24817b4007331a8e7bf5d9b900ef20675bc741fa4a83;
    stim[11] = 224'h54225bbda1eb1806db68b4ff3509f2ae2c699aaa019062d36b08cc24;
    stim[12] = 224'h2e32e98cfaf498d1aab6ff9d06a5db48dd825ee23abe089aacfe9175;
    stim[13] = 224'ha51851db016db185bf80a41f953bfe2c9ed168cce4b27e5efb2d7def;
    stim[14] = 224'h6b4e9434e8d6f4dd9cb3fa13e9997181ffdaa4b1f8757301d06f61e4;
    stim[15] = 224'h18eecc19d1cb526529bc7c85081d550c59bc55e51f3e4944042835a7;
    stim[16] = 224'h3d0cbdc8307bdd74a6d3ef703cbf839c8c249951d5ceab1196e0cce5;
    stim[17] = 224'h4bc43f68277e27bceee31d7771fe7523c0dba624fb4ffa4e2f6b0081;
    stim[18] = 224'h5dc992009cd0bede741ac543bcfcf0d152b4dd7c23397f0f034de979;
    stim[19] = 224'h2dc85bd816f7d6f37de042f62a73ba2b58cca28325fbd8b456e643db;
    stim[20] = 224'h01073b356e0d9ba35b2224a061f9c7ca8da3cce2c53fa270b352c337;
    stim[21] = 224'h3a83098a768d69e2b5d1c7685e6f3bb533abfca694ec6a589b3560cb;
    stim[22] = 224'h5d52984b7ed3d101c995019043f0b8c47de3dd48e9222b4adf5e46ee;
    stim[23] = 224'h2bdbd567b5f29f9cc38065706c8c23c4d2eb14d99e65fc092844dc19;
    stim[24] = 224'h5babaa8dbbd83ba7f192f17e4c3b23332b484c57fe7187179fe9561c;
    stim[25] = 224'h2b3512e9055646410a5df73cba75a101b3f98d16558a6caf5b3f9799;
    stim[26] = 224'h5dbf8dcd5e887c79f3e8398fffd85c7d1526e41ec2ab344d3f867f8d;
    stim[27] = 224'h5f024f8465f4b7566c39e9a6105099973059bc503a6efa989cf851f0;
    stim[28] = 224'h395a8e06e77674cf316b07e987ca26448bbe453d6020a46fb54ed34b;
    stim[29] = 224'h5b897e5e81bf511f540dbe60c014be8733940f3e81e7782d5f6576d7;
    stim[30] = 224'h16dbc7703f43bb3533c2f6c580b859795812a0f7194001cb51961c15;
    stim[31] = 224'h2eebdb24efdac4dc023fa70c20b57adb2f13fa140693d5dca3e6d1b3;
    stim[32] = 224'h5ba6dd94297cf76e170931f4d9cd1c2a705ae51de2ffd44eee5f747d;
    stim[33] = 224'h7951b4c29e4131d6d0f3bea60e100cb0d6df07ea5c7a7dde1b4bf38d;
    stim[34] = 224'h1d0bb5db8784d6adc6e7e0af3abc461041277bfe6318ddf09eaa5096;
    stim[35] = 224'h2db4b82d59072666219719b7694530dee79270e841f669972ecfc31b;
    stim[36] = 224'h5069b9304b0bfd7a5139ec952aee7452c4f65bde8698be3975afa840;
    stim[37] = 224'h69e851dd005dbf7ad0e861ecef1b9d31734055a9a0fcc8f52dac35a8;
    stim[38] = 224'h7be25df7b90be3a7b426dce8e2359480d496f7e0b9e861f6fdc1c424;
    stim[39] = 224'h467470cbd56f00d35730f33e81f3d3f18f41f0785962a049c8b3f6d6;
    stim[40] = 224'h569d15ae26da2cae7cfc803e1d5678c5111ff52757ddf6135ce860e8;
    stim[41] = 224'h3f2f259a9e8cb1712bbdadd3812e97e79c5b22f008cb57cfdb55cc9a;
    stim[42] = 224'h480e740ea3f523a3baa14113ea2fb19ac89fc819803e2d8a583f75b2;
    stim[43] = 224'h66aaddea188d73861c4d7338943e2765712b775aa69adae499f9484e;
    stim[44] = 224'h19c8cf59425cd8d806ff8b7a84d9a5214e198b4753be932b4a256bf2;
    stim[45] = 224'h097e869b852fd39ea2dbc8a1b737b4f66bbcc8a9468e88a9d8007fd8;
    stim[46] = 224'h77b8d16291380685b12baf539e3d0d0f79402b198d19abce98b1168b;
    stim[47] = 224'h5ce77b8905ec5152e2609c3bceda5828a8164e2d7d6908d5e6398ab3;
    stim[48] = 224'h5a8e8c89271b4b65677c8870b56a857914cc5251b4aab4e5fa6dd549;
    stim[49] = 224'h183c9136f19c0d29dee4557afcc45782f328b30ad7915c40b5ae3ab2;
    stim[50] = 224'h0c6ba8347a2ed033eee33edda71459ce2a5e58cf1130de73dc30e630;
    stim[51] = 224'h5edd10116005fc1adffef3fd3f812f11dedc9de66b0dca0cfb2dd01e;
    stim[52] = 224'h40c7c096e25af0e9e85cdda6ce39a232e17a73b34d275f81a27f361f;
    stim[53] = 224'h1f362a3a7c22597783029e33c99f77d419f61a2553c00e65a3db0136;
    stim[54] = 224'h35a3a129c5fbb981595371e51d4b90dbda3d0525062006c162e8f137;
    stim[55] = 224'h35605677f9a079522ac753e27bb93f7c5b291d452c2d02f11de5b46a;
    stim[56] = 224'h19bbbaaa3710d6b9f8c0facf29f739e2c14c23cba034df0c7aab369f;
    stim[57] = 224'h4766d0e83df31d49a694169901f660cb464454b9ff7a1ea5221b7dc0;
    stim[58] = 224'h7b550b3b4f101a3d53f7009be74ebc9e6a5dd078301ceeb4c4617f5a;
    stim[59] = 224'h7273147926c9e226afd150803dc21ca473099ae56bf78c75c9260a1a;
    stim[60] = 224'h536a62ff45be11235a58f0703c0897347af46f7292232cd2a44286da;
    stim[61] = 224'h47caa776b3c1ab7e1b4d33a9baa661d8c16075e6145956f6583e881e;
    stim[62] = 224'h0d57296f28af6021008103aff5835d141e1d59b316aae081e64ac8be;
    stim[63] = 224'h22db7a6c51aa2cee4cad07a1c5d3d02a1eea6c70829967b14afc1154;
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
      expv[0] = 143'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 143'h000000000000000000000000000000000000;
      expv[2] = 143'h000000000000000000000000000000000000;
      expv[3] = 143'h0000e709cb6e32065d240be10f20e5204690;
      expv[4] = 143'h0000e709cb6e32065d240be10f20e5204694;
      expv[5] = 143'h0001e709cb6e32065d240be10f20e5204694;
      expv[6] = 143'h0002e709cb6e32065d240be10f20e5204695;
      expv[7] = 143'h0003e709cb6e32065d240be10f20e5204695;
      expv[8] = 143'h0004e709cb6e32065d240be10f20e5204695;
      expv[9] = 143'h0005e709cb6e32065d240be10f20e5204695;
      expv[10] = 143'h0006e709cb6e32065d240be10f20e5204695;
      expv[11] = 143'h0007e709cb6e32065d240be10f20e5204695;
      expv[12] = 143'h0008e709cb6e32065d240be10f20e5204695;
      expv[13] = 143'h0009e709cb6e32065d240be10f20e5204695;
      expv[14] = 143'h000000000000000000000000000000000000;
      expv[15] = 143'h000000000000000000000000000000000000;
      expv[16] = 143'h000000000000000000000000000000000000;
      expv[17] = 143'h000000000000000000000000000000000000;
      expv[18] = 143'h000097887ed04efc4f79ddc63aeee3fcea40;
      expv[19] = 143'h000197887ed04efc4f79ddc63aeee3fcea44;
      expv[20] = 143'h000297887ed04efc4f79ddc63aeee3fcea45;
      expv[21] = 143'h000397887ed04efc4f79ddc63aeee3fcea45;
      expv[22] = 143'h000497887ed04efc4f79ddc63aeee3fcea45;
      expv[23] = 143'h000597887ed04efc4f79ddc63aeee3fcea45;
      expv[24] = 143'h000697887ed04efc4f79ddc63aeee3fcea45;
      expv[25] = 143'h000797887ed04efc4f79ddc63aeee3fcea45;
      expv[26] = 143'h000897887ed04efc4f79ddc63aeee3fcea45;
      expv[27] = 143'h000997887ed04efc4f79ddc63aeee3fcea45;
      expv[28] = 143'h000a97887ed04efc4f79ddc63aeee3fcea45;
      expv[29] = 143'h000b97887ed04efc4f79ddc63aeee3fcea45;
      expv[30] = 143'h000c97887ed04efc4f79ddc63aeee3fcea45;
      expv[31] = 143'h000d97887ed04efc4f79ddc63aeee3fcea45;
      expv[32] = 143'h000e97887ed04efc4f79ddc63aeee3fcea45;
      expv[33] = 143'h000f97887ed04efc4f79ddc63aeee3fcea45;
      expv[34] = 143'h001097887ed04efc4f79ddc63aeee3fcea45;
      expv[35] = 143'h001197887ed04efc4f79ddc63aeee3fcea45;
      expv[36] = 143'h001297887ed04efc4f79ddc63aeee3fcea45;
      expv[37] = 143'h001397887ed04efc4f79ddc63aeee3fcea45;
      expv[38] = 143'h001497887ed04efc4f79ddc63aeee3fcea45;
      expv[39] = 143'h001597887ed04efc4f79ddc63aeee3fcea45;
      expv[40] = 143'h001697887ed04efc4f79ddc63aeee3fcea45;
      expv[41] = 143'h001797887ed04efc4f79ddc63aeee3fcea45;
      expv[42] = 143'h001897887ed04efc4f79ddc63aeee3fcea45;
      expv[43] = 143'h001997887ed04efc4f79ddc63aeee3fcea45;
      expv[44] = 143'h001a97887ed04efc4f79ddc63aeee3fcea45;
      expv[45] = 143'h001b97887ed04efc4f79ddc63aeee3fcea45;
      expv[46] = 143'h001c97887ed04efc4f79ddc63aeee3fcea45;
      expv[47] = 143'h001d97887ed04efc4f79ddc63aeee3fcea45;
      expv[48] = 143'h001e97887ed04efc4f79ddc63aeee3fcea45;
      expv[49] = 143'h001f97887ed04efc4f79ddc63aeee3fcea45;
      expv[50] = 143'h002097887ed04efc4f79ddc63aeee3fcea45;
      expv[51] = 143'h002197887ed04efc4f79ddc63aeee3fcea45;
      expv[52] = 143'h002297887ed04efc4f79ddc63aeee3fcea45;
      expv[53] = 143'h002397887ed04efc4f79ddc63aeee3fcea45;
      expv[54] = 143'h002497887ed04efc4f79ddc63aeee3fcea45;
      expv[55] = 143'h002597887ed04efc4f79ddc63aeee3fcea45;
      expv[56] = 143'h002697887ed04efc4f79ddc63aeee3fcea45;
      expv[57] = 143'h002797887ed04efc4f79ddc63aeee3fcea45;
      expv[58] = 143'h002897887ed04efc4f79ddc63aeee3fcea45;
      expv[59] = 143'h002997887ed04efc4f79ddc63aeee3fcea45;
      expv[60] = 143'h002a97887ed04efc4f79ddc63aeee3fcea45;
      expv[61] = 143'h002b97887ed04efc4f79ddc63aeee3fcea45;
      expv[62] = 143'h002c97887ed04efc4f79ddc63aeee3fcea45;
      expv[63] = 143'h002d97887ed04efc4f79ddc63aeee3fcea45;
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
