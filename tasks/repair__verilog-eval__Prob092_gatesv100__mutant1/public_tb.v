// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 300;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[99:0]),
    .out_both(out_vec[299:200]),
    .out_any(out_vec[199:100]),
    .out_different(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h774a0c5055d1623ae6d0fd5db;
    stim[1] = 100'h3dea4db981d24c3674b7ef7e2;
    stim[2] = 100'h9f9069779a7908e83277b515b;
    stim[3] = 100'hff647fd6cc6032156b3487bcb;
    stim[4] = 100'hd5f3db4d112da8b6554f06fba;
    stim[5] = 100'h6a9cecbcb4e07ff45ab29aa01;
    stim[6] = 100'h9efd83c02eb7af841937ca11d;
    stim[7] = 100'h91830ce5a0cc52cfd6f7083d6;
    stim[8] = 100'haf1d45aab5e26aad17f75428a;
    stim[9] = 100'h037de1d261ce7b3e3efeb1f71;
    stim[10] = 100'h4df7b0d5da5ae7fb9326b44c8;
    stim[11] = 100'hd17db1104845eee95f1564588;
    stim[12] = 100'ha637a835f4bb2f319ef11c5a4;
    stim[13] = 100'h07967dd0c1f7ca5ab3beb5ee7;
    stim[14] = 100'h0ff4bd71539ae2f15ac011f37;
    stim[15] = 100'hd8a71b45f5aa134a884feb577;
    stim[16] = 100'hc38e92c78f4bda010d362498d;
    stim[17] = 100'h87e3714767d4cd49964176d92;
    stim[18] = 100'hc06a660aa7e24abbb5ddd4298;
    stim[19] = 100'h83bf1c4f6b8bec05f0776963a;
    stim[20] = 100'h6ebd9b168bedfd1bbd6952ebc;
    stim[21] = 100'h5053c4b8d75b1789905bb5fbb;
    stim[22] = 100'he2887461c7a759dd410243830;
    stim[23] = 100'hf3c8435885432b9c3b69558e4;
    stim[24] = 100'h7f15026d70bcaff680c8334e1;
    stim[25] = 100'h25cd0d98a972eec535cc6f1e0;
    stim[26] = 100'h278d22eb42a7e8e1be6a6fae4;
    stim[27] = 100'ha1208f30910b9f55fe1b3fb66;
    stim[28] = 100'ha5c0c1231365f2cd8d4d6bc65;
    stim[29] = 100'hb45f16e0fa8f982b2c04104e7;
    stim[30] = 100'hc7f02302c526c35ef64a45053;
    stim[31] = 100'ha964e797cd35360b88c299a37;
    stim[32] = 100'h976762dacabeb1e3ff64a11db;
    stim[33] = 100'hee3f2b0e35a0c78385c476b0f;
    stim[34] = 100'hbe7fae8b3c683e9266157eee2;
    stim[35] = 100'h0e514b10ac970ed05727252c6;
    stim[36] = 100'h644f818a76fb4e2f62fed8a95;
    stim[37] = 100'hd9df0c82d39bacb1d52227af0;
    stim[38] = 100'hff8f049bc049f8b8b0a722dad;
    stim[39] = 100'h5da59c19fdb51e735cbca6a6e;
    stim[40] = 100'he399e4dbd4a57d15da0dbe890;
    stim[41] = 100'h7610e84d3615a02febd0305ae;
    stim[42] = 100'hec76b97c552913d908aec8874;
    stim[43] = 100'h1c238cbe40eabc7372c94501f;
    stim[44] = 100'hf2026e7282837130d0ff3baf7;
    stim[45] = 100'h422d3a29254919da58f7eae0e;
    stim[46] = 100'h71522ad83c5d39adabd94bf96;
    stim[47] = 100'h39d88d51c217a82283718e846;
    stim[48] = 100'h275f9709d1bae944ac4f4bfba;
    stim[49] = 100'h013546073fa1a7e81d9204d6d;
    stim[50] = 100'h950e0510eceac10b09965bb9d;
    stim[51] = 100'hd273c4d1fbc19f3aff84c43f1;
    stim[52] = 100'hf7a5dc11d497d227530a0bc99;
    stim[53] = 100'h3c813d3a7d4c96448fc863b61;
    stim[54] = 100'hd3b3479f29e644d337e54454f;
    stim[55] = 100'he1b37b587db836900a0c0dd2c;
    stim[56] = 100'h68917c13fe7b75802b1910f4d;
    stim[57] = 100'h97f217f53849ce0cf00202eb9;
    stim[58] = 100'h81b37c61b964c9daed4fc58cf;
    stim[59] = 100'hda748d22e829aedf1cb1709fc;
    stim[60] = 100'h10c7a1fa3d4c2ff8ffbc7d621;
    stim[61] = 100'hb25a37e33ccbc2aac41537bd2;
    stim[62] = 100'h35815039190086cad627bd9e4;
    stim[63] = 100'h3d8cbdb99757a807b162a88c2;
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
      expv[0] = 300'h774a0c5055d1623ae6d0fd5dbffde1cf0fff3e67feff1ffffeccef0a787f39d32795b883f36;
      expv[1] = 300'h3dea4db981d24c3674b7ef7e27ffedffb83f6dc7efdfffffe6231f6b65413b6a2d4eec18c13;
      expv[2] = 300'h1f9069779a7908e83277b515bbfb0fbffbefb19f876ffff3fe50585dcc57458c9c2b4c6f9f6;
      expv[3] = 300'h7f647fd6cc6032156b3487bcbffecffffdce0763fff7d8ffde00d6403daa502b1fdeaec462e;
      expv[4] = 300'h55f3db4d112da8b6554f06fbafff7ffdf337ff9feffdf0fffebf0a36eb99bb7ced7fe885867;
      expv[5] = 300'h6a9cecbcb4e07ff45ab29aa01ffbdfdfdfde0fffcfff7bfe02dfd29ae2ee90400e77ebd7f01;
      expv[6] = 300'h1efd83c02eb7af841937ca11dbfff87c07fffff8c3b7fde33e5183422039ec784615ac2f193;
      expv[7] = 300'h11830ce5a0cc52cfd6f7083d6b3871defe1dcf7dfffff187fed9428a9770aa7ba83d8c8c23d;
      expv[8] = 300'h2f1d45aab5e26aad17f75428aff3fcfffffe6ffff3ffffc79ef893e77fef135ffb9c0cfe3cf;
      expv[9] = 300'h037de1d261ce7b3e3efeb1f7107ffe3f6e3deff7e7ffff3ff282c3113b512946a12181e90c9;
      expv[10] = 300'h4df7b0d5da5ae7fb9326b44c8dffff1fffeffefffb76ffcdd86b0c68bf377794065ab5ee6ac;
      expv[11] = 300'h517db1104845eee95f1564588f3fff330d8cffffbff3fecf98b9c369986c67199df09fd674c;
      expv[12] = 300'h2637a835f4bb2f319ef11c5a4ee7ff87ffdff7f73bff33cfecf52c7c2f0ee6b8a9518992776;
      expv[13] = 300'h07967dd0c1f7ca5ab3beb5ee70fbefff1c3ffdefff7fffffee845d4338a10c2f77ea61ef194;
      expv[14] = 300'h0ff4bd71539ae2f15ac011f371ffdfff3f7bfe7f3ffc033f7e880ee3c9fa579389f7a0190ac;
      expv[15] = 300'h58a71b45f5aa134a884feb577f9ef3fcffffe37df98dfffffe34f496e70f7f1aefcc681efcc;
      expv[16] = 300'h438e92c78f4bda010d362498dc79fb7cf9fdffe031f7e6db9e2249dba448ee37018bad36d4b;
      expv[17] = 300'h07e3714767d4cd49964176d928fe7f3cfeffddfdbbec3fffb6c412c9e4d43eabed5d61cdb5b;
      expv[18] = 300'h406a660aa7e24abbb5ddd4298c0feee1fefe6dffffffffc7b8a05f550ff4136fe66f333e3d4;
      expv[19] = 300'h03bf1c4f6b8bec05f0776963a87ff3cdfff9ffc0ff0fffbe7ec2609268de4e1a07084cddd27;
      expv[20] = 300'h6ebd9b168bedfd1bbd6952ebcffffbf3f9fffff3ffffbf7ffc59e3569dce1b039663ddfb9e2;
      expv[21] = 300'h5053c4b8d75b1789905bb5fbbf0f7cdf9ffff3f9bb0ffffffef87a26e4bcf69c4d58766f066;
      expv[22] = 300'h62887461c7a759dd410243830e798fce3cfeffbffc306c787093cc4e512474f533e18362428;
      expv[23] = 300'h73c8435885432b9c3b69558e4f7d8c7f98fc77fbc7ffbff9ec8a2c62f4c7e2be5226ddff496;
      expv[24] = 300'h7f15026d70bcaff680c8334e1ff3f06fff1fdffff81d877de2c09f835bc8e2f80dc0ac2ae91;
      expv[25] = 300'h25cd0d98a972eec535cc6f1e06fdf1fb9fbf7ffcf7fdcff3e0372b8b54fdcb99a7af2a58910;
      expv[26] = 300'h278d22eb42a7e8e1be6a6fae46f9f67ffc7eff9e3fefefffec344bb39ee3f41c91615f58796;
      expv[27] = 300'h21208f30910b9f55fe1b3fb66e3619f71b31fbffffe3f7ffeef1b0c8a8d98e50ff0116a06d5;
      expv[28] = 300'h25c0c1231365f2cd8d4d6bc65efc1c36737eff7df9fdfffcee7720a1b29ad70bab4bebde257;
      expv[29] = 300'h345f16e0fa8f982b2c04104e7fcff3fe1ff9fb87f7c0c30dee6e709d9087c8543eba0618694;
      expv[30] = 300'h47f02302c526c35ef64a45053cff06707cf6fc7fffedecf0f624083283a7b5a2f18d6f6787a;
      expv[31] = 300'h2964e797cd35360b88c299a37fbedefbfdf7f7e1f99c7bbe7e7dd6945c2bafad0e4ca3d572c;
      expv[32] = 300'h176762dacabeb1e3ff64a11dbbfefe7ffdffff3e7ffede33fe5cd4d3b7afe1e91200d6f1936;
      expv[33] = 300'h6e3f2b0e35a0c78385c476b0ffe7f7f1e7fe1cf878fccfff1e1920be892f70a44247264de88;
      expv[34] = 300'h3e7fae8b3c683e9266157eee2feffff9f7cf87fb6ee3ffffe6e14079cea25c21db551fc1993;
      expv[35] = 300'h0e514b10ac970ed05727252c61ef3df31fdbf1ff0ff6f6f7ce0979ee98fadc89b87cb4b7ba5;
      expv[36] = 300'h644f818a76fb4e2f62fed8a95ecdf839effffde7fe7fff9fbed668414f4d86e938d381b4fdf;
      expv[37] = 300'h59df0c82d39bacb1d52227af0fbff1d87f7bffdf3ff666fff0b5308ac3ba567ae93fb334788;
      expv[38] = 300'h7f8f049bc049f8b8b0a722dadff9f0dbfc0dbf9f9f1ef67ffe004886d6206d04e4e8f4b3b7b;
      expv[39] = 300'h5da59c19fdb51e735cbca6a6effefbc3bffff3ef7fdfdefefe73775215036f914af2e2f5f59;
      expv[40] = 300'h6399e4dbd4a57d15da0dbe890e7bbedfffdefff3ffe1fff9b0925516b63ef7c39f370b61cd8;
      expv[41] = 300'h7610e84d3615a02febd0305aefe31f8df7e3fe07ffff070ffe4d189c6bad1f70381e3828779;
      expv[42] = 300'h6c76b97c552913d908aec8874fcfffbfcff7b37fb19ffd98fc9a4de5c27fbd9a358cf9acc4e;
      expv[43] = 300'h1c238cbe40eabc7372c94501f3c679dfec1fffcf7f7dbcf03e92324ae1609fe24acbade7810;
      expv[44] = 300'h72026e7282837130d0ff3baf7f606fef78787f371f1ff7fffe0b03594bc3c2c9a8b880a678c;
      expv[45] = 300'h422d3a29254919da58f7eae0ec67f7e7b6fdb3bfef9ffffe1e633ba73db7ed9537748c1f909;
      expv[46] = 300'h71522ad83c5d39adabd94bf96f3f67ff87cff7bfffffbdffbe49fb3fb42273a57b7e35ee05d;
      expv[47] = 300'h39d88d51c217a82283718e8467bf99ff3c63ff86787f39f8ce2534cbf9231c7c33c2c949c65;
      expv[48] = 300'h275f9709d1bae944ac4f4bfba6fffbf1bf3fffbcdfcdfdfffe34f05c8d39679de6fa68ee067;
      expv[49] = 300'h013546073fa1a7e81d9204d6d037fce0f7fe3eff83fb60dffe81afe504a071741c135b06bdb;
      expv[50] = 300'h150e0510eceac10b09965bb9dbf1e0f31fdffc31f1bbefffbe5f8907989a9fa18e8d5d76653;
      expv[51] = 300'h5273c4d1fbc19f3aff84c43f1f6f7cdf3ffc3bf7fff8dcc7f23b4a26b9062150a78046a6209;
      expv[52] = 300'h77a5dc11d497d227530a0bc99ffeffc33fdbff66ff71e1fdba0c7732193edc3b34fa8f0e2d5;
      expv[53] = 300'h3c813d3a7d4c96448fc863b617d837f7effddbecd9fd8e7fe2a2c1a3a743eadd66c82c526d1;
      expv[54] = 300'h53b3479f29e644d337e54454ff7f7cfbf7beecdf77fefccfde3a6ae450bd1566baac17e67e8;
      expv[55] = 300'h61b37b587db836900a0c0dd2ce3f7fff8fff87fb01e1c1ff7c916ac6f443642dd80f0a0b3ba;
      expv[56] = 300'h68917c13fe7b75802b1910f4df9b3fc37feffff807f3b31fdedcd9c21a0146cf403e95988eb;
      expv[57] = 300'h17f217f53849ce0cf00202eb9bff63fff78dbde1df00607ffa5c0b1c0fa46d290a8803039e5;
      expv[58] = 300'h01b37c61b964c9daed4fc58cf83f7fce3fbeddbffffdfcf9de416ac25165d6ad379be8274a8;
      expv[59] = 300'h5a748d22e829aedf1cb1709fcfefd9f67f87bffff3df3f1bfcb74ecbb39c3d79b092e9c8d02;
      expv[60] = 300'h10c7a1fa3d4c2ff8ffbc7d62131cfe3fe7fdc7ff9fffcffe6298a4710723ea3804806243d31;
      expv[61] = 300'h325a37e33ccbc2aac41537bd2f6fe7fe77ddfc7ffcc3f7fff6eb772c12a2ae23ffa61fac63b;
      expv[62] = 300'h35815039190086cad627bd9e47f83f07b3b018fdffe6fffbec2f41f8259580c5afbd3463516;
      expv[63] = 300'h3d8cbdb99757a807b162a88c27f9dfffbbffff80ff3e7f99c6234ae3655cfc7c0469d3fcca3;
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
